module Yandex
  module Music
    module Utils
      module Audio
        class Link < Yandex::Music::Base
          def call
            data
          end

          private

          def data
            return '' if @args.track_id.blank?

            host, ts, path =
              audio_data_response_data.values_at('host', 'ts', 'path')

            "https://#{host}/get-mp3/0/#{ts}#{path}"
          end

          def audio_data_response_data
            JSON.parse(audio_data_response)
          end

          def audio_data_response
            RestClient.get(audio_data_link, audio_data_headers)
          end

          def audio_data_link
            "https:#{track_data_response_data['src']}"
          end

          def track_data_response_data
            JSON.parse(track_data_response)
          end

          def track_data_response
            RestClient.get(track_data_link, track_data_headers)
          end

          def track_data_link
            'https://music.yandex.ru/api/v2.1'\
              "/handlers/track/#{@args.track_id}"\
              '/web-album_track-track-track-main/download/m'
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
            secrets.yandex[:session_id]
          end

          def audio_data_headers
            { params: { format: 'json' } }
          end
        end
      end
    end
  end
end
