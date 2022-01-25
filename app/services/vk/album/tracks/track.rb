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
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id:,
            source_id: SOURCE_ID,
            vk_id:,
            title:,
            extra_title:,
            artists:
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            duration:,
            duration_seconds:,
            audio: audio_data
          }
        end
      end
    end
  end
end
