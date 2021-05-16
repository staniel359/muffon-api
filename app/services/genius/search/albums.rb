module Genius
  module Search
    class Albums < Genius::Search::Base
      private

      def model_name
        'album'
      end

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['name'],
          genius_id: album['id'],
          artist: artist_data(album),
          image: image_data(album['cover_art_url']),
          released: released(album)
        }
      end

      def artist_data(album)
        {
          name: album.dig('artist', 'name'),
          genius_id: album.dig('artist', 'id')
        }
      end
    end
  end
end
