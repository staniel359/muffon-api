module Yandex
  module Music
    module Utils
      module Audio
        class Link < Yandex::Music::Base
          def call
            return '' if @args.track_id.blank?
            return retry_with_new_session_id if wrong_session_id?

            data
          end

          private

          def wrong_session_id?
            track_data_response_data['preview']
          end

          def track_data_response_data
            @track_data_response_data ||=
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
            if Rails.env.test?
              secrets.yandex[:test_session_id]
            else
              global.get('yandex_session_id')
            end
          end

          def retry_with_new_session_id
            global.set('yandex_session_id', new_session_id)

            self.class.call(track_id: @args.track_id)
          end

          def new_session_id
            Yandex::Music::Utils::SessionId.call
          end

          def data
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

          def audio_data_headers
            { params: { format: 'json' } }
          end
        end
      end
    end
  end
end
