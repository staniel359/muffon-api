module MusixMatch
  module Album
    class Base < MusixMatch::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_slug
        ]
      end

      def raw_album_data
        response_data.dig(
          'pageProps',
          'data',
          'albumGet',
          'data'
        )
      end

      def link
        "#{BASE_LINK}/album/#{@args[:album_slug]}.json"
      end

      def data
        { album: album_data }
      end
    end
  end
end
