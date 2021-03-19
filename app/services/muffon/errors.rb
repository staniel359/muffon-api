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
          errors: [RestClient::BadRequest],
          handler: format_handler([400, 'Bad request'])
        }
      end

      def format_handler(data)
        { error: { code: data[0], text: data[1] } }
      end

      def not_found_data
        {
          errors: [RestClient::NotFound],
          handler: format_handler([404, 'Not found'])
        }
      end

      def too_many_requests_data
        {
          errors: [RestClient::TooManyRequests],
          handler: format_handler([429, 'Too Many Requests'])
        }
      end

      def bad_gateway_data
        {
          errors: [
            RestClient::InternalServerError,
            RestClient::ServiceUnavailable,
            JSON::ParserError, SocketError,
            Errno::ENETUNREACH, OpenSSL::SSL::SSLError
          ],
          handler: format_handler([502, 'Bad Gateway'])
        }
      end

      def gateway_timeout_data
        {
          errors: [RestClient::Exceptions::OpenTimeout],
          handler: format_handler([504, 'Gateway Timeout'])
        }
      end
    end
  end
end
