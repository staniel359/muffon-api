module LastFM
  class Base < Muffon::Base
    def call
      return errors.bad_request if not_all_args?
      return errors.not_found if no_data?

      data
    rescue StandardError => e
      handle_error(e)
    end

    private

    def handle_error(error)
      case error
      when *bad_request_errors then errors.bad_request
      when *not_found_errors then errors.not_found
      when *bad_gateway_errors then errors.bad_gateway
      when *gateway_timeout_errors then errors.gateway_timeout
      end
    end

    def bad_request_errors
      [RestClient::BadRequest]
    end

    def not_found_errors
      [RestClient::NotFound]
    end

    def bad_gateway_errors
      [RestClient::InternalServerError, JSON::ParserError, SocketError]
    end

    def gateway_timeout_errors
      [RestClient::Exceptions::OpenTimeout]
    end
  end
end
