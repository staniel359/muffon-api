module MusixMatch
  module Artist
    class Base < MusixMatch::Base
      def call
        check_args

        data
      rescue Faraday::ResourceNotFound => e
        handle_not_found_error(e)
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
        "#{base_link}/artist/#{@args[:artist_slug]}.json"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end
    end
  end
end
