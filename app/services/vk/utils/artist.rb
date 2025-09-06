module VK
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
          id: vk_id,
          links: source_links
        }
      end

      def vk_id
        artist['id']
      end

      def original_link
        "https://vk.ru/artist/#{vk_id}"
      end

      def image_data
        image_data_formatted(
          image, 'artist'
        ) || super
      end

      def image
        artist['photo']
      end
    end
  end
end
