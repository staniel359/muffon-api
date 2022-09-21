module API
  module LastFM
    class ConnectController < API::LastFM::UsersController
      def token; end

      private

      def token_data
        ::LastFM::Connect::Token.call
      end
    end
  end
end
