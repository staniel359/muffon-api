module Muffon
  class Errors < Muffon::Base
    class << self
      def list
        errors_handlers_data.values.pluck(:errors).flatten
      end

      def handle(error)
        errors_handlers_data.values.find do |k, _|
          k[:errors].include?(error)
        end.try(:[], :handler)
      end

      def handlers
        OpenStruct.new(
          errors_handlers_data.transform_values { |v| v[:handler] }
        )
      end

      private

      def errors_handlers_data
        {
          bad_request: bad_request_data,
          not_found: not_found_data,
          too_many_requests: too_many_requests_data,
          bad_gateway: bad_gateway_data,
          gateway_timeout: gateway_timeout_data
        }
      end

      def bad_request_data
        {
          errors: bad_request_errors,
          handler: format_handler([400, 'Bad request'])
        }
      end

      def bad_request_errors
        [RestClient::BadRequest]
      end

      def format_handler(data)
        { error: { code: data[0], text: data[1] } }
      end

      def not_found_data
        {
          errors: not_found_errors,
          handler: format_handler([404, 'Not found'])
        }
      end

      def not_found_errors
        [RestClient::NotFound]
      end

      def too_many_requests_data
        {
          errors: too_many_requests_errors,
          handler: format_handler([429, 'Too Many Requests'])
        }
      end

      def too_many_requests_errors
        [RestClient::TooManyRequests]
      end

      def bad_gateway_data
        {
          errors: bad_gateway_errors,
          handler: format_handler([502, 'Bad Gateway'])
        }
      end

      def bad_gateway_errors
        [
          RestClient::InternalServerError,
          RestClient::ServerBrokeConnection,
          RestClient::ServiceUnavailable,
          RestClient::RequestFailed, SocketError,
          Errno::ENETUNREACH, Errno::ECONNREFUSED,
          OpenSSL::SSL::SSLError, JSON::ParserError
        ]
      end

      def gateway_timeout_data
        {
          errors: gateway_timeout_errors,
          handler: format_handler([504, 'Gateway Timeout'])
        }
      end

      def gateway_timeout_errors
        [
          RestClient::Exceptions::OpenTimeout,
          RestClient::GatewayTimeout
        ]
      end
    end
  end
end
