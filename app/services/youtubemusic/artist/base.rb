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

      def request_url
        "#{REQUEST_BASE_URL}/browse"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias raw_artist_data response_data
    end
  end
end
