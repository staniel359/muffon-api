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
          model: bandcamp_model
        }
      end

      def bandcamp_id
        artist['id']
      end

      def bandcamp_model
        'artist'
      end

      def image_data
        image_data_formatted(
          image
        )
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
