module Spotify
  module Track
    class Base < Spotify::Base
      include Spotify::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_spotify_token
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def not_found?
        raw_track_data['__typename'] == 'GenericError'
      end

      def raw_track_data
        response_data.dig(
          'data',
          'trackUnion'
        )
      end

      def spotify_uri
        "spotify:track:#{@args[:track_id]}"
      end

      def data
        { track: track_data }
      end

      alias response post_response
    end
  end
end
