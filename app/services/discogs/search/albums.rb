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

      def collection_data
        response_data['results'].map do |a|
          {
            title: a['title'],
            images: images(a['cover_image'], 'album'),
            released: a['year'].to_s,
            discogs_id: a['id']
          }
        end
      end
    end
  end
end
