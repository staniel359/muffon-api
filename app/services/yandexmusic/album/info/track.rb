module YandexMusic
  module Album
    class Info
      class Track < YandexMusic::Album::Info
        include YandexMusic::Utils::Track

        def call
          data
        end

        private

        def data
          base_data.merge(extra_data)
        end

        def base_data
          {
            library_id: library_id,
            title: title,
            extra_title: extra_title,
            yandex_music_id: yandex_music_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def extra_data
          {
            duration: duration,
            audio: audio_data
          }
        end
      end
    end
  end
end
