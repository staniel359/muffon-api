module MusixMatch
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        raw_track_data['name']
      end

      def source_data
        {
          name: source_name,
          slug: musixmatch_track_slug,
          links: source_links_data
        }
      end

      def musixmatch_track_slug
        raw_track_data['vanityId']
      end

      def original_link
        "https://www.musixmatch.com/lyrics/#{musixmatch_track_slug}"
      end

      def musixmatch_artist_slug
        musixmatch_track_slug.split('/')[0]
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
          id: musixmatch_artist_slug
        }
      end

      def artist_name
        raw_track_data['artistName']
      end

      def album_data
        return if album_title.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def album_title
        raw_track_data['albumName']
      end

      def album_source_data
        {
          name: source_name,
          slug: musixmatch_album_slug
        }
      end

      def musixmatch_album_slug
        raw_track_data['albumVanityId']
      end

      def image_data
        image_data_formatted(
          raw_image
        )
      end

      def raw_image
        raw_track_data['coverImageHD']
      end
    end
  end
end
