module AmazonMusic
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist.dig(
          'primaryText',
          'text'
        )
      end

      def source_data
        {
          name: source_name,
          id: amazonmusic_id,
          links: source_links
        }
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def amazonmusic_slug
        artist.dig(
          'primaryLink',
          'deeplink'
        )
      end

      def original_link
        "https://music.amazon.com#{amazonmusic_slug}"
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
        artist['image']
      end
    end
  end
end
