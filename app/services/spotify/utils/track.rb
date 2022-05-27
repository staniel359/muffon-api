module Spotify
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def artists_list
        track['artists']
      end

      def source_data
        {
          name: source_name,
          id: track['id']
        }
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['name']
        }
      end

      def album
        track['album']
      end

      def album_source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        image_data_formatted(
          album['images']
        )
      end

      def duration_seconds
        track['duration_ms'].fdiv(
          1_000
        ).ceil
      end

      def audio_data
        { present: audio_present? }
      end

      def audio_present?
        track[
          'available_markets'
        ].include?('GB')
      end
    end
  end
end
