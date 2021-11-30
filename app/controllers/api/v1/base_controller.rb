module API
  module V1
    class BaseController < ApplicationController
      private

      def render_data_with_status
        render(
          {
            json: data,
            status: status
          }
        )
      end

      def data
        @data ||= send(
          "#{params[:action]}_data"
        )
      end

      def status
        return 204 if data.blank?

        data.dig(:error, :code) || 200
      end
    end
  end
end
