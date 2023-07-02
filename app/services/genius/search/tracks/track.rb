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
          self_data
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
            artist: artists_minimal_data,
            artists:,
            image: image_data
          }.compact
        end
      end
    end
  end
end
