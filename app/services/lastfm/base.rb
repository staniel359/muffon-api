module LastFM
  class Base < Muffon::Base
    def call
      return errors.bad_request if not_all_args?
      return errors.not_found if no_data?

      data
    rescue *errors_to_handle => e
      handle_error(e)
    end

    private

    def errors_to_handle
      [
        bad_request_errors,
        not_found_errors,
        bad_gateway_errors,
        gateway_timeout_errors
      ].flatten
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

    def handle_error(error)
      case error
      when *bad_request_errors then errors.bad_request
      when *not_found_errors then errors.not_found
      when *bad_gateway_errors then errors.bad_gateway
      when *gateway_timeout_errors then errors.gateway_timeout
      end
    end
  end
end
