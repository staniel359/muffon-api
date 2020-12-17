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
            image: g['cover_image'],
            released: g['year'].to_s,
            format: g['format'].uniq.join(', '),
            discogs_id: g['master_id']
          }
        end
      end
    end
  end
end
