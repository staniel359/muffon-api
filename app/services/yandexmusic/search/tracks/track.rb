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
            source_id:,
            player_id:,
            yandex_music_id:,
            title:,
            extra_title:,
            artist: artist_names_data,
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
