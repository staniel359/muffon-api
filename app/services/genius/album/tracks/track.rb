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

        def track
          @args[:track]
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artist_names_data,
            artists:
          }
        end
      end
    end
  end
end
