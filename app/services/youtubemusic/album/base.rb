module YouTubeMusic
  module Album
    class Base < YouTubeMusic::Base
      BASE_LINK =
        'https://music.youtube.com/youtubei/v1/browse'.freeze

      include YouTubeMusic::Utils::Album

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
          album_id
        ]
      end

      def not_found?
        raw_album_data
          .dig(
            'contents',
            'twoColumnBrowseResultsRenderer'
          )
          .blank?
      end

      def link
        BASE_LINK
      end

      def payload
        {
          'browseId' => @args[:album_id],
          'context' => context_data
        }.to_json
      end

      def data
        { album: album_data }
      end

      alias response post_response
      alias raw_album_data response_data
    end
  end
end
