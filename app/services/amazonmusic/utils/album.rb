module AmazonMusic
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album.dig(
          'primaryText',
          'text'
        )
      end

      def raw_artists
        [artist_data]
      end

      def artist_data
        {
          'name' => artist_name,
          'id' => artist_amazonmusic_id
        }
      end

      def artist_name
        album['secondaryText']
      end

      def artist_amazonmusic_id
        artist_amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def artist_amazonmusic_slug
        album.dig(
          'secondaryLink',
          'deeplink'
        )
      end

      def source_data
        {
          name: source_name,
          id: amazonmusic_id,
          links: source_links_data
        }
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          %r{albums/(.+)}
        )[1]
      end

      def amazonmusic_slug
        album.dig(
          'primaryLink',
          'deeplink'
        )
      end

      def original_link
        "https://music.amazon.com#{amazonmusic_slug}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'album',
          model_id: amazonmusic_id
        )
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
        album['image']
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album.dig(
          'primaryLink',
          'onItemSelected',
          1,
          'template',
          'headerTertiaryText'
        )
      end
    end
  end
end
