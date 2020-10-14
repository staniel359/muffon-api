module Bandcamp
  class Base < Muffon::Base
    def call
      return bad_request_error if not_all_args?
      return not_found_error if no_data?
      return retry_with_redirect_link if no_tracks?

      data
    rescue RestClient::NotFound, SocketError
      not_found_error
    end

    private

    def no_tracks?
      false
    end
  end
end
