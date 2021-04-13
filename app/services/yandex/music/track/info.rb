module Yandex
  module Music
    module Track
      class Info < Yandex::Music::Base
        private

        def primary_args
          [@args.track_id]
        end

        def no_data?
          response_data.blank?
        end

        def response_data
          @response_data ||= super['track']
        end

        def link
          'https://music.yandex.ru/handlers/track.jsx'
        end

        def params
          {
            track: @args.track_id,
            lang: 'en'
          }
        end

        def data
          { track: track_data }
        end

        def track_data
          track_base_data.merge(track_extra_data)
        end

        def track_base_data
          {
            id: track_id(artist_name(response_data), title),
            title: title,
            artist: artist_data
          }
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data(album_raw_data, 'track'),
            length: length(response_data),
            audio: audio_data
          }
        end

        def album_data
          return {} if album_raw_data.blank?

          { title: album_raw_data['title'] }
        end

        def album_raw_data
          @album_raw_data ||= response_data.dig('albums', 0)
        end

        def audio_data
          {
            present: audio_link.present?,
            link: audio_link,
            source: 'yandex_music'
          }
        end

        def audio_link
          @audio_link ||= Yandex::Music::Utils::Audio::Link.call(
            track_id: response_data['id'].to_i
          )
        end
      end
    end
  end
end
