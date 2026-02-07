module Spotify
  module Track
    class Base < Spotify::Base
      include Spotify::Utils::Track

      def call
        check_args

        data
      rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError => e
        # retry_with_new_spotify_token
        raise e
      rescue Faraday::BadRequestError, Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def no_data?
        track.blank?
      end

      def link
        "#{BASE_LINK}/tracks/#{@args[:track_id]}"
      end

      def data
        { track: track_data }
      end

      alias track response_data
    end
  end
end
