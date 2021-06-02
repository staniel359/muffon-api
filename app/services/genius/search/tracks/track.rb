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
          {
            title: title,
            genius_id: genius_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            image: image_data
          }
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
