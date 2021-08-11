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
      end
    end
  end
end
