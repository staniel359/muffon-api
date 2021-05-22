module Genius
  module Search
    class Artists < Genius::Search::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      private

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
