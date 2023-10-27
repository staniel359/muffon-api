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
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track
          @args[:track]
        end

        def track_base_data
          {
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:
          }.compact
        end

        def track_extra_data
          {
            duration:,
            audio: audio_minimal_data
          }
        end
      end
    end
  end
end
