module API
  module V1
    class BaseController < ApplicationController
      before_action :render_data_with_status

      private

      def render_data_with_status
        render(
          {
            json: action_data,
            status: status_code
          }
        )
      end

      def action_data
        @action_data ||=
          action_service&.call(action_service_args)
      end

      def action_service
        Muffon::API::Service.call(
          params.slice(:controller, :action)
        )
      end

      def action_service_args
        params.slice(*permitted_params)
      end

      def permitted_params
        %i[
          artist album track tag label
          page next_page limit offset
          artist_id album_id track_id
          owner_id group_id label_id
          query access_hash album_type
          path
        ]
      end

      def status_code
        return 204 if action_data.blank?

        action_data.dig(:error, :code) || 200
      end
    end
  end
end
