module Spotify
  module Album
    class Base < Spotify::Base
      include Spotify::Utils::Album

      def call
        check_args

        data
      # rescue Faraday::UnauthorizedError, Faraday::TooManyRequestsError
      #   retry_with_new_spotify_token
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def data
        { album: album_data }
      end

      def link
        "#{BASE_LINK}/albums/#{@args[:album_id]}"
      end

      alias album response_data
    end
  end
end
