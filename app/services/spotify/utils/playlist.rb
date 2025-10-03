module Spotify
  module Utils
    module Playlist
      private

      def source_data
        {
          name: source_name,
          id: spotify_id,
          links: source_links_data
        }
      end

      def spotify_id
        playlist['id']
      end

      def original_link
        playlist.dig(
          'external_urls',
          'spotify'
        )
      end

      def title
        playlist['name']
      end

      def description
        return if raw_description.blank?

        raw_description.gsub(
          '<a href=spotify:playlist:',
          '<a href=https://open.spotify.com/playlist/'
        )
      end

      def raw_description
        playlist['description'].presence
      end

      def image_data
        image_data_formatted(
          images
        )
      end

      def images
        playlist['images']
      end
    end
  end
end
