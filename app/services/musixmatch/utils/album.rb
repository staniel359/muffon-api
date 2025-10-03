module MusixMatch
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['album_name']
      end

      def source_data
        {
          name: source_name,
          id: musixmatch_id,
          links: source_links_data
        }
      end

      def musixmatch_id
        album['album_id']
      end

      def original_link
        'https://www.musixmatch.com/album' \
          "/#{artist_id}/#{musixmatch_id}"
      end

      def artist_id
        album['artist_id']
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
          id: artist_id
        }
      end

      def artist_name
        album['artist_name']
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album['album_release_date']
      end
    end
  end
end
