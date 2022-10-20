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
      return forbidden unless allowed_request?

      send(
        "#{params[:action]}_data"
      )
    end

    def allowed_request?
      test? || valid_token?
    end

    def test?
      Rails.env.test?
    end

    def valid_token?
      return false if token.blank?

      token_profile.present? ||
        anonymous_token?
    end

    def token
      params[:token]
    end

    def token_profile
      Profile.find_by(
        token:
      )
    end

    def anonymous_token?
      token == secrets.anonymous[:token]
    end

    def secrets
      Rails.application.credentials
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
