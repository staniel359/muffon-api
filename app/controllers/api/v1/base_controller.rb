module API
  module V1
    class BaseController < ApplicationController
      before_action :render_data_with_status

      private

      def render_data_with_status
        render json: action_data, status: status_code
      end

      def action_data
        @action_data ||=
          data_service.call(params.slice(*action_params))
      end

      def data_service
        "lastfm/#{data_namespace}".camelize.constantize
      end

      def data_namespace
        modified_actions[controller_action] || controller_action
      end

      def modified_actions
        {
          'album/albums' => 'artist/albums',
          'track/tracks' => 'artist/tracks'
        }
      end

      def controller_action
        "#{controller_name.singularize}/#{params[:action]}"
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
