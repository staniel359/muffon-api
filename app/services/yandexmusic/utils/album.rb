module YandexMusic
  module Utils
    module Album
      include Muffon::Utils::Album

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

      def artist_name
        artist_names
      end

      def artists_list
        album['artists'].presence ||
          [default_artist_data]
      end

      def default_artist_data
        {
          'id' => 171,
          'name' => 'Various artists'
        }
      end

      def image_data
        image_data_formatted(
          album, 'album'
        )
      end

      def release_date
        date_formatted(
          album['year'].to_s
        )
      end
    end
  end
end
