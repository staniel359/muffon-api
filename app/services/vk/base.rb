module VK
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return retry_with_new_remixsid if auth_failed?
      return handlers.not_found if no_data?

      data
    end

    private

    def auth_failed?
      false
    end

    def retry_with_new_remixsid
      global.set('remixsid', new_remixsid)
      @response_data = nil
      call
    end

    def new_remixsid
      VK::Utils::Remixsid.call
    end
  end
end
