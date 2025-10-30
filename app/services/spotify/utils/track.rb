module Spotify
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['name']
      end

      def raw_artists
        track['artists']
      end

      def source_data
        {
          name: source_name,
          id: spotify_id,
          links: source_links_data
        }
      end

      def spotify_id
        track['id']
      end

      def original_link
        track.dig(
          'external_urls',
          'spotify'
        )
      end

      def streaming_link
        return if spotify_id.blank?

        streaming_link_formatted(
          model: 'track',
          model_id: spotify_id
        )
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

      def duration
        track['duration_ms'].fdiv(
          1_000
        ).ceil
      end

      def audio_present?
        true
      end
    end
  end
end
