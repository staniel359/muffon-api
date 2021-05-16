module Genius
  module Search
    class Tracks < Genius::Search::Base
      private

      def model_name
        'song'
      end

      def collection_name
        'tracks'
      end

      def collection_item_data(track)
        {
          title: track['title'],
          genius_id: track['id'],
          artist: artist_data(track)
        }
      end

      def artist_data(track)
        {
          name: track.dig('primary_artist', 'name'),
          genius_id: track.dig('primary_artist', 'id')
        }
      end
    end
  end
end
