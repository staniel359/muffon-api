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
          artist: artist_data(item),
          image: image_data(item[:image]),
          id_data: id_data(item[:link])
        }
      end
    end
  end
end
