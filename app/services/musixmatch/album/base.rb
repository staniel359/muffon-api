module MusixMatch
  module Album
    class Base < MusixMatch::Base
      BASE_LINK =
        'https://www.musixmatch.com/_next/data/fNde2hbCe1brBnYf2PEOi/en/album'.freeze

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
        "#{BASE_LINK}/#{@args[:album_slug]}.json"
      end

      def data
        { album: album_data }
      end
    end
  end
end
