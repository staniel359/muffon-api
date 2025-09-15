module Muffon
  module Utils
    class Errors
      ERRORS_DATA = {
        bad_request: {
          errors: [
            Faraday::BadRequestError
          ],
          handler: {
            error: {
              code: 400,
              text: 'Bad request'
            }
          }
        },
        forbidden: {
          errors: [
            Faraday::ForbiddenError
          ],
          handler: {
            error: {
              code: 403,
              text: 'Forbidden'
            }
          }
        },
        not_found: {
          errors: [
            Faraday::ResourceNotFound
          ],
          handler: {
            error: {
              code: 404,
              text: 'Not found'
            }
          }
        },
        too_many_requests: {
          errors: [
            Faraday::ClientError
          ],
          handler: {
            error: {
              code: 429,
              text: 'Too Many Requests'
            }
          }
        },
        bad_gateway: {
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
          handler: {
            error: {
              code: 502,
              text: 'Bad Gateway'
            }
          }
        },
        gateway_timeout: {
          errors: [
            Faraday::TimeoutError
          ],
          handler: {
            error: {
              code: 504,
              text: 'Gateway Timeout'
            }
          }
        }
      }.freeze

      class << self
        def list
          ERRORS_DATA.values.pluck(
            :errors
          ).flatten
        end

        def handlers
          ERRORS_DATA.transform_values do |v|
            v[:handler]
          end
        end

        def handle(error)
          handler =
            ERRORS_DATA
            .values
            .find do |k|
              k[:errors].include?(error)
            end
            .try(:[], :handler)

          handler || raise(error)
        end
      end
    end
  end
end
