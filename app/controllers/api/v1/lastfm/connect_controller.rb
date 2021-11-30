module API
  module V1
    module LastFM
      class ConnectController < API::V1::LastFM::UsersController
        def token
          render_data_with_status
        end

        def session
          render_data_with_status
        end

        private

        def token_data
          ::LastFM::Connect::Token.call
        end

        def session_data
          ::LastFM::Connect::Session.call(
            params.slice(
              *%i[token profile_id]
            )
          )
        end
      end
    end
  end
end
