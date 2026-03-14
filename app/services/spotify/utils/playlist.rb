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
        raw_playlist_data['uri'].sub(
          'spotify:playlist:',
          ''
        )
      end

      def original_link
        "https://open.spotify.com/playlist/#{spotify_id}"
      end

      def title
        raw_playlist_data['name']
      end

      def description
        return if raw_description.blank?

        raw_description.gsub(
          '<a href=spotify:playlist:',
          '<a href=https://open.spotify.com/playlist/'
        )
      end

      def raw_description
        raw_playlist_data['description'].presence
      end

      def image_data
        image_data_formatted(
          raw_images
        )
      end

      def raw_images
        raw_playlist_data.dig(
          'images',
          'items',
          0,
          'sources'
        )
      end
    end
  end
end
