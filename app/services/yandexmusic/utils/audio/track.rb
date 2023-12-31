module YandexMusic
  module Utils
    module Audio
      class Track < YandexMusic::Base
        include Muffon::Utils::Global

        def call
          return if not_all_args?
          return retry_with_new_session_id if wrong_session_id?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def wrong_session_id?
          response_data['preview']
        rescue JSON::ParserError
          true
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
              'https://music.yandex.ru/',
            'User-Agent' => USER_AGENT
          }
        end

        def cookies
          {
            'Session_id' => session_id,
            'L' => l_cookie
          }
        end

        def session_id
          return test_session_id if test?

          get_global_value(
            'yandex_music_session_id'
          )
        end

        def test_session_id
          secrets.yandex_music[
            :test_session_id
          ]
        end

        def global_value
          @global_value ||=
            YandexMusic::Utils::SessionId.call
        end

        def retry_with_new_session_id
          return data if global_value.blank?

          @global_value = nil

          update_global_value(
            'yandex_music_session_id'
          )

          call
        end

        def l_cookie
          secrets.yandex_music[
            :l_cookie
          ]
        end

        alias data response_data
      end
    end
  end
end
