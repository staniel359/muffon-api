module YandexMusic
  module Search
    class Tracks
      class Track < YandexMusic::Search::Tracks
        include YandexMusic::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id:,
            source_id: SOURCE_ID,
            yandex_music_id:,
            title:,
            extra_title:,
            artists:
          }.compact
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            album: albums&.first,
            image: image_data,
            duration:,
            duration_seconds:,
            audio: audio_data
          }.compact
        end
      end
    end
  end
end
