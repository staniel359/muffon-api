module YandexMusic
  module Utils
    module Album
      private

      def title
        album['title']
      end

      def extra_title
        album['version']
      end

      def yandex_music_id
        album['id']
      end

      def artists_list
        album['artists']
      end

      def image_data
        image_data_formatted(album, 'album')
      end

      def release_date
        date_formatted(album['year'].to_s)
      end
    end
  end
end
