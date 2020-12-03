module Bandcamp
  class Base < Muffon::Base
    def call
      return errors.bad_request if not_all_args?
      return errors.not_found if no_data?
      return retry_with_redirect_link if no_tracks?

      data
    rescue RestClient::NotFound, SocketError
      errors.not_found
    end

    private

    def no_tracks?
      false
    end
  end
end
