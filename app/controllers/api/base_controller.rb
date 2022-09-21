module API
  class BaseController < ApplicationController
    before_action :render_data_with_status

    include ::Muffon::Utils::ErrorHandlers

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
      @data ||= data_conditional
    end

    def data_conditional
      return forbidden unless allowed?

      send(
        "#{params[:action]}_data"
      )
    end

    def allowed?
      true
    end

    def status
      return 204 if data.blank?

      data.dig(
        :error, :code
      ) || 200
    end

    def sendable_attachment_types
      ::Muffon::Utils::Sendable::ATTACHMENT_TYPES
    end
  end
end
