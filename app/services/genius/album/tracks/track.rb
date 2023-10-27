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
          self_data
            .merge(track_data)
        end

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end
      end
    end
  end
end
