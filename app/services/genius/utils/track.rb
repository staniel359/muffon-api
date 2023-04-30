module Genius
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title_with_featured']
      end

      def source_data
        {
          name: source_name,
          id: genius_id,
          links: source_links
        }
      end

      def genius_id
        track['id']
      end

      def original_link
        track['url']
      end

      def artist_name
        artist['name']
      end

      def artist
        track['primary_artist']
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['name']
        }
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
          track['song_art_image_url']
        )
      end
    end
  end
end
