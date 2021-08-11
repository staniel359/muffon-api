module API
  module V1
    module LastFM
      class UsersController < API::V1::BaseController
        def info
          render_data_with_status
        end

        def plays
          render_data_with_status
        end
      end
    end
  end
end
