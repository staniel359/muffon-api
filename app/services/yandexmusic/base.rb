module YandexMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'yandexmusic'.freeze
    REQUEST_BASE_URL = 'https://music.yandex.ru/handlers'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          proxy: request_proxy
        )
    end

    def request_params
      { language: }
    end

    def request_proxy
      proxy_data[:ru].sample
    end
  end
end
