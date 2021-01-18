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

      def groups
        response_data['results'].map do |g|
          {
            title: g['title'],
            image: images(g),
            released: g['year'].to_s,
            discogs_id: g['master_id']
          }
        end
      end

      def images(group)
        {
          original: group['cover_image']
        }
      end
    end
  end
end
