module API
  class BaseController < ApplicationController
    CLIENT_MINIMUM_VERSION = '2.3.0'.freeze

    include ::Muffon::Utils::Errors

    before_action :render_status_with_data

    private

    def render_status_with_data
      render(
        status:,
        json: data
      )
    end

    def data
      @data ||= action_data
    end

    def action_data
      raise forbidden_error unless request_allowed?

      send(
        "#{params[:action]}_data"
      )
    rescue StandardError => e
      handle_error(e)
    end

    def request_allowed?
      valid_version? &&
        valid_access_token?
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

    def valid_access_token?
      ::Muffon::AccessToken::Validator.call(
        access_token: params[:token]
      )
    end

    def handle_error(
      error
    )
      error_data =
        ERRORS_DATA
        .values
        .find do |error_data|
          error_data[:errors].include?(
            error.class
          )
        end

      raise error if error_data.blank?

      {
        error:
          error_data[:response]
      }
    end

    def status
      if data.present?
        error_code || :ok
      else
        :no_content
      end
    end

    def error_code
      data.dig(
        :error,
        :code
      )
    end

    def sendable_attachment_types
      ::Muffon::Utils::Sendable::ATTACHMENT_TYPES
    end
  end
end
