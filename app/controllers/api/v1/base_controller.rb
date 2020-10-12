module API
  module V1
    class BaseController < ApplicationController
      before_action :render_data_with_status

      private

      def render_data_with_status
        render json: action_data, status: status_code
      end

      def action_data
        @action_data ||= data_service.call(data_params)
      end

      def data_service
        Muffon::ActionService.call(
          params.slice(:controller, :action)
        )
      end

      def data_params
        params.slice(*action_params).merge(model: model_name)
      end

      def model_name
        controller_name.singularize
      end

      def action_params
        %i[artist album track tag page limit]
      end

      def status_code
        action_data.dig(:error, :code) || 200
      end
    end
  end
end