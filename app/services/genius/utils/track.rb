module Genius
  module Utils
    module Track
      private

      def title
        track['title_with_featured']
      end

      def genius_id
        track['id']
      end

      def artist
        track['primary_artist']
      end

      def image_data
        image_data_formatted(
          track['song_art_image_url']
        )
      end
    end
  end
end
