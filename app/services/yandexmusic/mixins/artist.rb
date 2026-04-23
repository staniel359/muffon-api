module YandexMusic
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['name']
      end

      def yandexmusic_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://music.yandex.ru/artist/#{yandexmusic_id}"
      end

      def image_data
        YandexMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_artist_data.dig(
          'cover',
          'uri'
        )
      end
    end
  end
end
