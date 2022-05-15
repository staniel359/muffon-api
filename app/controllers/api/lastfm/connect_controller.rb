module API
  module LastFM
    class ConnectController < API::LastFM::UsersController
      def token
        render_data_with_status
      end

      private

      def token_data
        ::LastFM::Connect::Token.call
      end
    end
  end
end
