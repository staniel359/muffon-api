module Genius
  module Search
    class Tracks < Genius::Search::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'song'.freeze

      private

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
