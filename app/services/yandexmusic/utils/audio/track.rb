module YandexMusic
  module Utils
    module Audio
      class Track < YandexMusic::Base
        include Muffon::Utils::Global

        def call
          return if @args[:track_id].blank?
          return retry_with_new_session_id if wrong_session_id?

          data
        rescue StandardError
          nil
        end

        private

        def wrong_session_id?
          response_data['preview']
        end

        def link
          'https://music.yandex.ru/api/v2.1' \
            "/handlers/track/#{@args[:track_id]}" \
            '/web-album_track-track-track-main' \
            '/download/m'
        end

        def headers
          {
            'X-Retpath-Y' => 'https://music.yandex.ru/',
            'User-Agent' => user_agent,
            cookies:
          }
        end

        def cookies
          { 'Session_id' => session_id }
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
          return if global_value.blank?

          update_global_value(
            'yandex_music_session_id'
          )

          call
        end

        alias data response_data
      end
    end
  end
end
