module API
  module LastFM
    class ConnectionsController < API::BaseController
      def token; end

      def create; end

      def destroy; end

      private

      def token_data
        ::LastFM::Connection::Token.call(
          params.slice(
            *%i[language]
          )
        )
      end

      def create_data
        ::LastFM::Connection::Creator.call(
          params.slice(
            *%i[lastfm_token profile_id token]
          )
        )
      end

      def destroy_data
        ::LastFM::Connection::Destroyer.call(
          params.slice(
            *%i[profile_id token]
          )
        )
      end
    end
  end
end
