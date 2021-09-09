module Muffon
  module Utils
    class Errors
      class << self
        ERRORS_DATA = {
          bad_request: {
            errors: [
              RestClient::BadRequest
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
              RestClient::Forbidden
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
              RestClient::NotFound
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
              RestClient::TooManyRequests
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
              Errno::EHOSTUNREACH,
              Errno::ENETUNREACH,
              JSON::ParserError,
              OpenSSL::SSL::SSLError,
              RestClient::InternalServerError,
              RestClient::RequestFailed,
              RestClient::ServerBrokeConnection,
              RestClient::ServiceUnavailable,
              RestClient::SSLCertificateNotVerified,
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
              RestClient::GatewayTimeout,
              RestClient::Exceptions::OpenTimeout
            ],
            handler: {
              error: {
                code: 504,
                text: 'Gateway Timeout'
              }
            }
          }
        }.freeze

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
          ERRORS_DATA.values.find do |k|
            k[:errors].include?(error)
          end.try(:[], :handler)
        end
      end
    end
  end
end
