module Bandcamp
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          id: bandcamp_id,
          model: bandcamp_model,
          links: source_links
        }.compact_blank
      end

      def bandcamp_id
        artist['id']
      end

      def bandcamp_model
        'artist'
      end

      def original_link
        artist['item_url_root']
      end

      def image_data
        image_data_formatted(
          image
        ) || super
      end

      def image
        'https://f4.bcbits.com/img' \
          "/00#{image_id}_10.jpg"
      end

      def image_id
        artist['image_id']
      end
    end
  end
end
