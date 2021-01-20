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

      def collection_data
        response_data['results'].map do |l|
          {
            title: l['title'],
            images: images(l['cover_image'], 'artist'),
            discogs_id: l['id']
          }
        end
      end
    end
  end
end
