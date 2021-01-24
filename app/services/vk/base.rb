module VK
  class Base < Muffon::Base
    private

    def retry_with_new_remixsid
      global.set('remixsid', new_remixsid)
      @response_data = nil

      global.get('remixsid').present? ? call : handlers.not_found
    end

    def new_remixsid
      VK::Utils::Remixsid.call
    end

    def response
      RestClient.post(link, params, headers)
    end

    def images_data(image, model)
      VK::Utils::Images.call(image: image, model: model)
    end
  end
end
