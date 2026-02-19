module MusixMatch
  module Track
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
          track_slug
        ]
      end

      def data
        { track: track_data }
      end

      def raw_track_data
        response_data.dig(
          'pageProps',
          'data',
          'trackInfo',
          'data',
          'track'
        )
      end

      def link
        "#{BASE_LINK}/lyrics/#{@args[:track_slug]}.json"
      end
    end
  end
end
