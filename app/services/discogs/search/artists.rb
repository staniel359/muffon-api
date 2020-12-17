module Discogs
  module Search
    class Artists < Discogs::Search::Base
      private

      def collection_type
        'artist'
      end

      def artists
        response_data['results'].map do |a|
          {
            name: a['title'],
            image: a['cover_image'],
            discogs_id: a['id']
          }
        end
      end
    end
  end
end
