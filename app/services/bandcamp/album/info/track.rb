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
            source_id:,
            player_id:,
            bandcamp_id:,
            title:,
            artist: artist_names_data,
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
            source_id:,
            present: audio_present?,
            track_id: bandcamp_id,
            artist_id: artist_bandcamp_id
          }
        end
      end
    end
  end
end
