module Genius
  module Search
    class Artists < Genius::Search::Base
      private

      def model_name
        'artist'
      end

      def collection_name
        'artists'
      end

      def collection_item_data(artist)
        {
          name: artist['name'],
          genius_id: artist['id'],
          image: image_data(artist['image_url'])
        }
      end
    end
  end
end
