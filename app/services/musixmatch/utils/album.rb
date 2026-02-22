module MusixMatch
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        raw_album_data['name']
      end

      def source_data
        {
          name: source_name,
          slug: CGI.escape(musixmatch_slug),
          links: source_links_data
        }
      end

      def musixmatch_slug
        raw_album_data['vanityId']
      end

      def original_link
        "https://www.musixmatch.com/album/#{musixmatch_slug}"
      end

      def musixmatch_artist_slug
        musixmatch_slug.split('/')[0]
      end

      def artists
        [artist_data]
      end

      def artist_data
        {
          source: artist_source_data,
          name: artist_name
        }
      end

      def artist_source_data
        {
          name: source_name,
          slug: musixmatch_artist_slug
        }
      end

      def artist_name
        raw_album_data['artistName']
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['releaseDate'] / 1_000
      end

      def image_data
        image_data_formatted(
          raw_image
        )
      end

      def raw_image
        raw_album_data['coverImage500x500']
      end
    end
  end
end
