module Bandcamp
  module Search
    class Albums < Bandcamp::Search::Base
      private

      def collection_name
        'albums'
      end

      def model_name
        'album'
      end

      def collection_item_data(item)
        {
          title: title(item),
          bandcamp_title: bandcamp_title(item),
          bandcamp_model: bandcamp_model(item),
          artist: artist_data(item),
          image: image_data(item[:image])
        }
      end
    end
  end
end
