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

    def artist_data(model)
      { name: artist_name(model) }
    end

    def artist_name(data)
      data.dig('user', 'username')
    end

    def images_data(data, model)
      SoundCloud::Utils::Images.call(data: data, model: model)
    end

    def length(data)
      data['duration'] / 1_000
    end
  end
end
