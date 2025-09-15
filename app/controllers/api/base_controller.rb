module API
  class BaseController < ApplicationController
    CLIENT_MINIMUM_VERSION = '2.3.0'.freeze

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
      return true if test?

      valid_version? && valid_token?
    end

    def test?
      Rails.env.test?
    end

    def valid_version?
      client_version.present? && (
        client_version >=
          client_minimum_version
      )
    end

    def client_version
      return if params[:version].blank?

      Gem::Version.new(
        params[:version]
      )
    end

    def client_minimum_version
      Gem::Version.new(
        CLIENT_MINIMUM_VERSION
      )
    end

    def valid_token?
      ::Muffon::Token::Validator.call(
        token: params[:token]
      )
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
