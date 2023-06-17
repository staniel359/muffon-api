module API
  module Spotify
    class ConnectionsController < API::BaseController
      def create; end

      def destroy; end

      private

      def create_data
        ::Spotify::Connection::Creator.call(
          params.slice(
            *%i[spotify_code profile_id token]
          )
        )
      end

      def destroy_data
        ::Spotify::Connection::Destroyer.call(
          params.slice(
            *%i[profile_id token]
          )
        )
      end
    end
  end
end
