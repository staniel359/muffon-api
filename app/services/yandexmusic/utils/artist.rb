module YandexMusic
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
          id: yandexmusic_id,
          links: source_links
        }
      end

      def yandexmusic_id
        artist['id']
      end

      def original_link
        "https://music.yandex.ru/artist/#{yandexmusic_id}"
      end

      def image_data
        image_data_formatted(
          artist
        )
      end
    end
  end
end
