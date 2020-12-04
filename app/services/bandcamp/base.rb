module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?
      return retry_with_redirect_link if no_tracks?

      data
    rescue RestClient::NotFound, SocketError
      handlers.not_found
    end

    private

    def no_tracks?
      false
    end
  end
end
