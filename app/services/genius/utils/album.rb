module Genius
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artist_name
        artist['name']
      end

      def artist
        album['artist']
      end

      def source_data
        {
          name: source_name,
          id: genius_id,
          links: source_links
        }
      end

      def genius_id
        album['id']
      end

      def original_link
        album['url']
      end

      def image_data
        image_data_formatted(
          album['cover_art_url']
        )
      end

      def release_date
        raw_release_date_formatted(
          album
        )
      end
    end
  end
end
