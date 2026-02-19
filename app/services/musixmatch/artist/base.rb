module MusixMatch
  module Artist
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
          artist_slug
        ]
      end

      def raw_artist_data
        response_data.dig(
          'pageProps',
          'data',
          'artistGet',
          'data'
        )
      end

      def link
        "#{BASE_LINK}/artist/#{@args[:artist_slug]}.json"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        raw_artist_data['name']
      end
    end
  end
end
