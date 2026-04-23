module VK
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def vk_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://vk.ru/artist/#{vk_id}"
      end

      def image_data
        VK::Formatter::Image.call(
          raw_images:
        )
      end

      def raw_images
        raw_artist_data['photo']
      end
    end
  end
end
