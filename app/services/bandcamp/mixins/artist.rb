module Bandcamp
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def bandcamp_id
        raw_artist_data['id']
      end

      def bandcamp_model
        'artist'
      end

      def source_original_link
        raw_artist_data['item_url_root']
      end

      def image_data
        Bandcamp::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        "https://f4.bcbits.com/img/00#{image_id}_10.jpg"
      end

      def image_id
        raw_artist_data['image_id']
      end
    end
  end
end
