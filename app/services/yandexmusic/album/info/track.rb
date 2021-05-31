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
          {
            title: title,
            extra_title: extra_title,
            yandex_music_id: yandex_music_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration,
            audio: audio_data
          }.compact
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
