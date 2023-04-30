module MusicBrainz
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        track['title']
      end

      def artists_list
        track['artist-credit']
      end

      def source_data
        {
          name: source_name,
          id: musicbrainz_id,
          links: source_links
        }
      end

      def musicbrainz_id
        track['id']
      end

      def original_link
        "https://musicbrainz.org/recording/#{musicbrainz_id}"
      end

      def album_data
        return if album.blank?

        {
          source: album_source_data,
          title: album['title'],
          model: 'album'
        }
      end

      def album
        track.dig(
          'releases', 0
        )
      end

      def album_source_data
        {
          name: source_name,
          id: album['id']
        }
      end

      def image_data
        return if album.blank?

        image_data_formatted(
          album['id']
        )
      end

      def duration
        return if track['length'].blank?

        track['length'] / 1_000
      end
    end
  end
end
