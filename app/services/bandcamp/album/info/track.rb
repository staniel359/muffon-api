module Bandcamp
  module Album
    class Info
      class Track < Bandcamp::Album::Info
        include Bandcamp::Utils::Track

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
            bandcamp_id:,
            title:,
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

        def audio_data
          {
            present: audio_present?,
            track_id: bandcamp_id,
            artist_id: artist_bandcamp_id,
            source_id: SOURCE_ID
          }
        end
      end
    end
  end
end
