module Muffon
  module Utils
    module Errors
      ERRORS_DATA = {
        'bad_request' => {
          errors: [
            Muffon::Error::BadRequestError
          ],
          response: {
            code: 400,
            text: 'Bad request'
          }
        },
        'forbidden' => {
          errors: [
            Muffon::Error::ForbiddenError
          ],
          response: {
            code: 403,
            text: 'Forbidden'
          }
        },
        'not_found' => {
          errors: [
            Muffon::Error::NotFoundError
          ],
          response: {
            code: 404,
            text: 'Not found'
          }
        },
        'bad_gateway' => {
          errors: [
            Errno::ECONNREFUSED,
            Errno::ECONNRESET,
            Errno::EHOSTUNREACH,
            Errno::ENETUNREACH,
            Faraday::ConnectionFailed,
            Faraday::ServerError,
            Faraday::SSLError,
            JSON::ParserError,
            Net::HTTPFatalError,
            OpenSSL::SSL::SSLError,
            SocketError
          ],
          response: {
            code: 502,
            text: 'Bad Gateway'
          }
        },
        'gateway_timeout' => {
          errors: [
            Faraday::TimeoutError
          ],
          response: {
            code: 504,
            text: 'Gateway Timeout'
          }
        }
      }.freeze

      private

      def bad_request_error
        Muffon::Error::BadRequestError
      end

      def not_found_error
        Muffon::Error::NotFoundError
      end

      def forbidden_error
        Muffon::Error::ForbiddenError
      end

      def error_response_data(
        error_key
      )
        error_data =
          ERRORS_DATA[error_key][:response]

        { error: error_data }
      end
    end
  end
end
