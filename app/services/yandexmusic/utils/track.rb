module YandexMusic
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        track['title']
      end

      def extra_title
        track['version']
      end

      def raw_artists
        track['artists']
      end

      def source_data
        {
          name: source_name,
          id: yandexmusic_id,
          links: source_links_data
        }
      end

      def yandexmusic_id
        track['id'].to_i
      end

      def original_link
        "https://music.yandex.ru/track/#{yandexmusic_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'track',
          model_id: yandexmusic_id
        )
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album_title(album)
        }.compact
      end

      def album
        track.dig(
          'albums', 0
        )
      end

      def album_source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def album_title(album)
        title_with_extra_title(
          album_raw_title(album),
          extra_title: album_extra_title(album)
        )
      end

      def album_raw_title(album)
        album['title']
      end

      def album_extra_title(album)
        album['version']
      end

      def image_data
        image_data_formatted(
          track
        )
      end

      def duration
        track['durationMs'].to_i / 1_000
      end

      def audio_present?
        track['available']
      end
    end
  end
end
