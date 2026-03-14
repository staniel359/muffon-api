module Spotify
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        raw_artist_data.dig(
          'profile',
          'name'
        )
      end

      def source_data
        {
          name: source_name,
          id: spotify_id,
          links: source_links_data
        }
      end

      def spotify_id
        raw_artist_data['uri'].sub(
          'spotify:artist:',
          ''
        )
      end

      def original_link
        "https://open.spotify.com/artist/#{spotify_id}"
      end

      def image_data
        image_data_formatted(
          raw_images
        ) || super
      end

      def raw_images
        raw_artist_data.dig(
          'visuals',
          'avatarImage',
          'sources'
        )
      end
    end
  end
end
