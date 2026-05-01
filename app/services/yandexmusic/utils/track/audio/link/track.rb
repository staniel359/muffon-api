module YandexMusic
  module Utils
    module Track
      module Audio
        class Link
          class Track < YandexMusic::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                track_id
              ]
            end

            def data
              Muffon::Request.call(
                url: request_url,
                method: 'GET',
                headers: request_headers,
                cookies: request_cookies,
                proxy: request_proxy
              )
            end

            def request_url
              'https://music.yandex.ru/api/v2.1' \
                "/handlers/track/#{@args[:track_id]}" \
                '/web-album_track-track-track-main' \
                '/download/m'
            end

            def request_headers
              {
                'X-Retpath-Y' =>
                  'https%3A%2F%2Fmusic.yandex.ru/'
              }
            end

            def request_cookies
              { 'Session_id' => session_id }
            end

            def session_id
              return 'test' if test?

              credentials.dig(
                :yandex_music,
                :session_id
              )
            end
          end
        end
      end
    end
  end
end
