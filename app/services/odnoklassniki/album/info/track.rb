module Odnoklassniki
  module Album
    class Info
      class Track < Odnoklassniki::Album::Info
        include Odnoklassniki::Utils::Track

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
            player_id: player_id,
            source_id: SOURCE_ID,
            odnoklassniki_id: odnoklassniki_id,
            title: title,
            artists: artists
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            duration: duration,
            duration_seconds: duration_seconds,
            audio: audio_data
          }
        end
      end
    end
  end
end
