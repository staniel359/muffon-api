module Discogs
  module Search
    class Labels < Discogs::Search::Base
      private

      def collection_type
        'label'
      end

      def labels
        response_data['results'].map do |l|
          {
            title: l['title'],
            image: l['cover_image'],
            discogs_id: l['id']
          }
        end
      end
    end
  end
end
