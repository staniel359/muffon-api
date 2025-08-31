module YandexMusic
  module Utils
    module Audio
      class Link
        class Track < YandexMusic::Utils::Audio::Link
          def call
            check_args

            data
          end

          private

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

            credentials.dig(
              :yandex_music,
              :session_id
            )
          end

          alias data response_data
        end
      end
    end
  end
end
