module YandexMusic
  module Utils
    module Audio
      class Link < YandexMusic::Base
        include Muffon::Utils::Global

        def call
          return '' if @args[:track_id].blank?
          return retry_with_new_session_id if wrong_session_id?

          data
        rescue StandardError
          call
        end

        private

        def wrong_session_id?
          track_data_response_data['preview']
        end

        def track_data_response_data
          @track_data_response_data ||=
            JSON.parse(
              track_data_response
            )
        end

        def track_data_response
          RestClient.get(
            track_data_link,
            track_data_headers
          )
        end

        def track_data_link
          'https://music.yandex.ru'\
            '/api/v2.1/handlers/track'\
            "/#{@args[:track_id]}"\
            '/web-album_track-track-track-main'\
            '/download/m'
        end

        def track_data_headers
          {
            cookies: track_data_cookies,
            'X-Retpath-Y' => 'https://music.yandex.ru/'
          }
        end

        def track_data_cookies
          { 'Session_id' => session_id }
        end

        def session_id
          return test_session_id if
              Rails.env.test?

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

        def data
          host, ts, path =
            audio_data_response_data.values_at(
              'host', 'ts', 'path'
            )

          "https://#{host}/get-mp3/0/#{ts}#{path}"
        end

        def audio_data_response_data
          JSON.parse(
            audio_data_response
          )
        end

        def audio_data_response
          RestClient.get(
            audio_data_link,
            audio_data_headers
          )
        end

        def audio_data_link
          "https:#{track_data_response_data['src']}"
        end

        def audio_data_headers
          { params: params }
        end

        def params
          { format: 'json' }
        end
      end
    end
  end
end
