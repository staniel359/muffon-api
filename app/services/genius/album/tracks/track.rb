module Genius
  module Album
    class Tracks
      class Track < Genius::Album::Tracks
        include Genius::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_data)
        end

        def track_data
          {
            player_id: player_id,
            source_id: SOURCE_ID,
            genius_id: genius_id,
            title: title,
            artists: artists
          }
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
