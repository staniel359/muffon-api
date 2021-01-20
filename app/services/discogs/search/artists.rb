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

      def collection_data
        response_data['results'].map do |a|
          {
            name: a['title'],
            images: images(a['cover_image'], 'artist'),
            discogs_id: a['id']
          }
        end
      end
    end
  end
end
