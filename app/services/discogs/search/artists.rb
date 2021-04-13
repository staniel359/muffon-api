module Discogs
  module Search
    class Artists < Discogs::Search::Base
      private

      def discogs_collection_type
        'artist'
      end

      def collection_type
        'artist'
      end

      def collection_name
        'artists'
      end

      def collection_item_data(artist)
        {
          name: artist['title'],
          image: image_data(artist['cover_image'], 'artist'),
          discogs_id: artist['id']
        }
      end
    end
  end
end
