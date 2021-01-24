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
        Muffon::Utils::EndpointService.call(
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
        %i[
          artist album track tag page limit offset query index
          next_page track_id album_id owner_id access_hash
          group_id artist_id label_id search_type link
        ]
      end

      def status_code
        action_data.dig(:error, :code) || 200
      end
    end
  end
end
