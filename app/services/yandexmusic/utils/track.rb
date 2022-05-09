module YandexMusic
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def extra_title
        track['version']
      end

      def yandex_music_id
        track['id'].to_i
      end

      def artists_list
        track['artists']
      end

      def albums_list
        track['albums']
      end

      def album_data_formatted(album)
        {
          source_id:,
          yandex_music_id: album['id'],
          title: album['title'],
          extra_title: album['version']
        }.compact
      end

      def image_data
        image_data_formatted(
          track
        )
      end

      def duration_seconds
        track['durationMs'] / 1_000
      end

      def audio_data
        {
          source_id:,
          present: track_present?,
          track_id: yandex_music_id
        }
      end

      def track_present?
        track['available']
      end
    end
  end
end
