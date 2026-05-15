module YandexMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'yandexmusic'.freeze
    REQUEST_BASE_URL = 'https://api.music.yandex.ru'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          headers: request_headers,
          proxy: request_proxy
        )
    end

    def request_params
      {}
    end

    def request_proxy
      proxy_data[:ru][0]
    end

    def request_headers
      {
        'Cookie' => request_cookie_header,
        'DNT' => '1',
        'Host' => 'api.music.yandex.ru',
        'Origin' => 'https://music.yandex.ru',
        'Referer' => 'https://music.yandex.ru/',
        'x-request-id' => uuid_string,
        'X-Requested-With' => 'XMLHttpRequest',
        'X-Retpath-Y' => 'https://music.yandex.ru/',
        'x-yandex-music-client' => 'YandexMusicWebNext/1.0.0',
        'x-yandex-music-multi-auth-user-id' => '2273883602',
        'x-yandex-music-without-invocation-info' => '1'
      }
    end

    def request_cookie_header
      credentials.dig(
        :yandexmusic,
        :cookie
      )
    end

    def page
      super.to_i
    end
  end
end
