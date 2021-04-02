module LastFM
  module Search
    class Tracks < LastFM::Search::Base
      private

      def model_name
        'track'
      end

      def collection_name
        'tracks'
      end

      def total_limit
        500
      end

      def collection_item_data(track)
        {
          id: track_id(track['artist'], track['name']),
          title: track['name'],
          artist: track_artist_data(track)
        }
      end

      def track_artist_data(track)
        { name: track['artist'] }
      end
    end
  end
end
