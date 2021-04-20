module Bandcamp
  module Search
    class Artists < Bandcamp::Search::Base
      private

      def collection_name
        'artists'
      end

      def model_name
        'artist'
      end

      def collection_item_data(item)
        {
          name: artist_name(item),
          bandcamp_name: bandcamp_artist(item),
          bandcamp_model: bandcamp_model(item),
          image: image_data(item[:image])
        }
      end
    end
  end
end
