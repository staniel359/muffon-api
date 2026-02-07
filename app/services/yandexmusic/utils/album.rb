module YandexMusic
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        album['title']
      end

      def extra_title
        album['version']
      end

      def raw_artists
        album['artists'].presence ||
          [artist]
      end

      def artist
        {
          'id' => 171,
          'name' => 'Unknown Artist'
        }
      end

      def source_data
        {
          name: source_name,
          id: yandexmusic_id,
          links: source_links_data
        }
      end

      def yandexmusic_id
        album['id']
      end

      def original_link
        "https://music.yandex.ru/album/#{yandexmusic_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'album',
          model_id: yandexmusic_id
        )
      end

      def image_data
        image_data_formatted(
          album
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
