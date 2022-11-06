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
            player_id:,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def track_extra_data
          {
            duration:,
            duration_seconds:,
            audio: audio_data
          }
        end

        def audio_data
          { present: audio_present? }
        end
      end
    end
  end
end
