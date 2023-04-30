module Spotify
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          id: spotify_id,
          links: source_links
        }
      end

      def spotify_id
        artist['id']
      end

      def original_link
        "https://open.spotify.com/artist/#{spotify_id}"
      end

      def image_data
        image_data_formatted(
          artist['images']
        )
      end
    end
  end
end
