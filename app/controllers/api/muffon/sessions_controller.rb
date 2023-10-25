module API
  module Muffon
    class SessionsController < API::BaseController
      def create; end

      private

      def create_data
        ::Muffon::Profile::Authenticator.call(
          params.slice(
            *authenticate_params
          )
        )
      end

      def authenticate_params
        ::Muffon::Profile::Authenticator::PARAMS
      end
    end
  end
end
