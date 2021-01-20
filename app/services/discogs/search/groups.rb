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

      def collection_data
        response_data['results'].map do |g|
          {
            title: g['title'],
            images: images(g['cover_image'], 'album'),
            released: g['year'].to_s,
            discogs_id: g['master_id']
          }
        end
      end
    end
  end
end
