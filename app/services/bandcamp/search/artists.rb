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
          images: images_data(image(item)),
          link: link_data(item['link']).slice(:artist)
        }
      end
    end
  end
end
