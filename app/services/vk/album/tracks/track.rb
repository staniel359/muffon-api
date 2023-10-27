module VK
  module Album
    class Tracks
      class Track < VK::Album::Tracks
        include VK::Utils::Track

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
          }
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
