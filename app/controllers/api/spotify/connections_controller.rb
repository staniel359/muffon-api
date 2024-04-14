module API
  module Spotify
    class ConnectionsController < API::BaseController
      def create; end

      def destroy; end

      private

      def create_data
        ::Spotify::Connection::Creator.call(
          params.slice(
            *%i[
              profile_id token code
              client_id client_secret
            ]
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
