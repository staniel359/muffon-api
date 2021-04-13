module Discogs
  module Search
    class Albums < Discogs::Search::Base
      private

      def discogs_collection_type
        'release'
      end

      def collection_type
        'album'
      end

      def collection_name
        'albums'
      end

      def collection_item_data(album)
        {
          title: album['title'],
          image: image_data(album['cover_image'], 'album'),
          released: album['year'].to_s,
          discogs_id: album['id']
        }
      end
    end
  end
end
