module Discogs
  module Search
    class Groups < Discogs::Search::Base
      private

      def discogs_collection_type
        'master'
      end

      def collection_type
        'group'
      end

      def collection_name
        'groups'
      end

      def collection_item_data(group)
        {
          title: group['title'],
          image: image_data(group['cover_image'], 'album'),
          released: group['year'].to_s,
          discogs_id: group['master_id']
        }
      end
    end
  end
end
