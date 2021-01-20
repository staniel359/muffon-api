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

      global.get('remixsid').present? ? call : handlers.not_found
    end

    def new_remixsid
      VK::Utils::Remixsid.call
    end

    def response
      RestClient.post(link, params, headers)
    end

    def images(image, model)
      if image.present?
        images_data(image)
      else
        default_images_data(model)
      end
    end

    def images_data(image)
      {
        original: image,
        large: image,
        medium: image,
        small: image,
        extrasmall: image
      }
    end
  end
end
