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
        response_data['results'].map do |g|
          {
            title: g['title'],
            image: g['cover_image'],
            released: g['year'].to_s,
            format: g['format'].uniq.join(', '),
            discogs_id: g['id'],
            discogs_group_id: g['master_id']
          }
        end
      end
    end
  end
end
