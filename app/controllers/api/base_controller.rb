module API
  class BaseController < ApplicationController
    private

    def render_data_with_status
      render(
        {
          json: data,
          status:
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

    def sendable_attachment_types
      ::Muffon::Utils::Sendable::ATTACHMENT_TYPES
    end
  end
end
