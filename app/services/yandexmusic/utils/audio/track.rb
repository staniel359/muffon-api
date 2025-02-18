module YandexMusic
  module Utils
    module Audio
      class Track < YandexMusic::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def data
          response_data
        rescue Faraday::ForbiddenError
          nil
        end

        def link
          'https://music.yandex.ru/api/v2.1' \
            "/handlers/track/#{@args[:track_id]}" \
            '/web-album_track-track-track-main' \
            '/download/m'
        end

        def params
          nil
        end

        def headers
          {
            'X-Retpath-Y' =>
              'https%3A%2F%2Fmusic.yandex.ru/',
            'Cookie' => cookies_string,
            'User-Agent' => USER_AGENT
          }
        end

        def cookies_string
          "Session_id=#{session_id}"
        end

        def session_id
          return 'test' if test?

          secrets[:yandex_music][:session_id]
        end
      end
    end
  end
end
