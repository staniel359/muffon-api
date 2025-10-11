module LastFM
  module Utils
    module Album
      DEFAULT_IMAGE_ID =
        'c6f59c1e5e7240a4c0d427abd71f3dbb'.freeze

      include Muffon::Utils::Album

      private

      def title
        album['name']
      end

      def artist_name
        album['artist']
      end

      def source_data
        {
          name: source_name,
          links: source_links_data
        }
      end

      def original_link
        "https://www.last.fm/music/#{original_link_artist_name}/#{original_link_title}"
      end

      def original_link_artist_name
        CGI.escape(
          artist_name
        )
      end

      def original_link_title
        CGI.escape(
          title
        )
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        album.dig(
          'image', -1, '#text'
        )
      end
    end
  end
end
