module SoundCloud
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      false
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, params: params)
    end

    def base_link
      'https://api.soundcloud.com'
    end

    def params
      base_params.merge(extra_params)
    end

    def base_params
      { client_id: client_id }
    end

    def extra_params
      {}
    end

    def client_id
      secrets.soundcloud[:api_key]
    end

    def images(data, model)
      if image(data).present?
        images_data(data)
      else
        default_images_data(model)
      end
    end

    def image(data)
      data['artwork_url']
    end

    def images_data(data)
      {
        original: crop_image(data, 't500x500'),
        large: crop_image(data, 't500x500'),
        medium: crop_image(data, 't300x300'),
        small: crop_image(data, 'large'),
        extrasmall: crop_image(data, 't67x67')
      }
    end

    def crop_image(data, size)
      data['artwork_url'].sub('large', size)
    end
  end
end
