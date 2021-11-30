module API
  module V1
    module Muffon
      class SessionsController < API::V1::BaseController
        def create
          render_data_with_status
        end

        private

        def create_data
          ::Muffon::Profile::Authenticator.call(
            authenticate_params
          )
        end

        def authenticate_params
          params.slice(
            *::Muffon::Profile::Authenticator::PARAMS
          )
        end
      end
    end
  end
end
