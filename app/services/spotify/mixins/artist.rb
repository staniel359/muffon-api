module Spotify
  module Mixins
    module Artist
      private

      def name
        raw_artist_data.dig(
          'profile',
          'name'
        )
      end

      def spotify_id
        raw_artist_data['uri'].sub(
          'spotify:artist:',
          ''
        )
      end

      def source_original_link
        "https://open.spotify.com/artist/#{spotify_id}"
      end

      def image_data
        Spotify::Formatter::Image.call(
          images:
        )
      end

      def images
        raw_artist_data.dig(
          'visuals',
          'avatarImage',
          'sources'
        )
      end
    end
  end
end
