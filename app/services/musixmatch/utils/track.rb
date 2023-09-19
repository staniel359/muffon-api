module MusixMatch
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['track_name']
      end

      def source_data
        {
          name: source_name,
          id: musixmatch_id,
          links: source_links
        }
      end

      def musixmatch_id
        track['commontrack_id']
      end

      def original_link
        'https://www.musixmatch.com/lyrics' \
          "/#{artist_id}/#{musixmatch_id}"
      end

      def artist_id
        track['artist_id']
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
        track['artist_name']
      end

      def album_data
        return if album_title.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def album_title
        track['album_name']
      end

      def album_source_data
        {
          name: source_name,
          id: track['album_id']
        }
      end
    end
  end
end
