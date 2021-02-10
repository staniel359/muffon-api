module Bandcamp
  module Search
    class Tracks < Bandcamp::Search::Base
      private

      def collection_name
        'tracks'
      end

      def model_name
        'track'
      end

      def collection_item_data(item)
        {
          title: title(item),
          artist: artist_data(item),
          images: images_data(image(item)),
          link: link_data(item['link']).slice(:title, :artist)
        }
      end
    end
  end
end
