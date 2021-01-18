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

      def albums
        response_data['results'].map do |a|
          {
            title: a['title'],
            images: images(a),
            released: a['year'].to_s,
            discogs_id: a['id']
          }
        end
      end

      def images(album)
        {
          original: album['cover_image']
        }
      end
    end
  end
end
