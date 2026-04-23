module Spotify
  module Mixins
    module Playlist
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_playlist_data['name']
      end

      def spotify_id
        raw_playlist_data['uri'].sub(
          'spotify:playlist:',
          ''
        )
      end

      def source_original_link
        "https://open.spotify.com/playlist/#{spotify_id}"
      end

      def description
        return if raw_description.blank?

        raw_description.gsub(
          '<a href=spotify:playlist:',
          '<a href=https://open.spotify.com/playlist/'
        )
      end

      def raw_description
        raw_playlist_data['description']
      end

      def image_data
        Spotify::Formatter::Image.call(
          images:
        )
      end

      def images
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
