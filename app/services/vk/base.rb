module VK
  class Base < Muffon::Base
    def call
      return bad_request_error if primary_args.any?(&:blank?)
      return retry_with_new_remixsid if auth_failed?
      return not_found_error if no_data?

      data
    end

    private

    def auth_failed?
      false
    end

    def retry_with_new_remixsid
      global.set('remixsid', new_remixsid)
      @parsed_response = nil
      call
    end

    def new_remixsid
      VK::Remixsid.call(args: nil)
    end
  end
end
