module Genius
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def genius_id
        album['id']
      end

      def artist
        album['artist']
      end

      def image_data
        image_data_formatted(
          album['cover_art_url']
        )
      end

      def release_date
        raw_release_date_formatted(album)
      end
    end
  end
end
