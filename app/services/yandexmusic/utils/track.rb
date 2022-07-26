module YandexMusic
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def artists_list
        track['artists']
      end

      def source_data
        {
          name: source_name,
          id: track['id'].to_i
        }
      end

      def extra_title
        track['version']
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['title'],
          extra_title: album['version']
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

      def image_data
        image_data_formatted(
          track
        )
      end

      def duration_seconds
        track['durationMs'].to_i / 1_000
      end

      def audio_data
        { present: audio_present? }
      end

      def audio_present?
        track['available']
      end
    end
  end
end
