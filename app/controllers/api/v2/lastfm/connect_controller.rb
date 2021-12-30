module API
  module V2
    module LastFM
      class ConnectController < API::V2::LastFM::UsersController
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
