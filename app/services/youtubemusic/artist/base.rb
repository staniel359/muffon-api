module YouTubeMusic
  module Artist
    class Base < YouTubeMusic::Base
      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        raw_artist_data
          .dig(
            'contents',
            'singleColumnBrowseResultsRenderer'
          )
          .blank?
      end

      def link
        "#{BASE_LINK}/browse"
      end

      def payload
        {
          'browseId' => @args[:artist_id],
          'context' => payload_context_data
        }.to_json
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias response post_response
      alias raw_artist_data response_data
    end
  end
end
