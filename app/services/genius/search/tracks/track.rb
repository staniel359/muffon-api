module Genius
  module Search
    class Tracks
      class Track < Genius::Search::Tracks
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
            player_id:,
            source_id: SOURCE_ID,
            genius_id:,
            title:,
            artists:,
            image: image_data
          }.compact
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
