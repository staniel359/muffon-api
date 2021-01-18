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

    def images(model)
      {
        original: image(model).sub('large', 't500x500'),
        large: image(model).sub('large', 't500x500'),
        medium: image(model).sub('large', 't300x300'),
        small: image(model),
        extrasmall: image(model).sub('large', 't67x67')
      }
    end

    def image(model)
      model['artwork_url'].to_s
    end
  end
end
