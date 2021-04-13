module Discogs
  module Search
    class Labels < Discogs::Search::Base
      private

      def discogs_collection_type
        'label'
      end

      def collection_type
        'label'
      end

      def collection_name
        'labels'
      end

      def collection_item_data(label)
        {
          title: label['title'],
          image: image_data(label['cover_image'], 'artist'),
          discogs_id: label['id']
        }
      end
    end
  end
end
