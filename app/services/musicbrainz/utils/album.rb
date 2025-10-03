module MusicBrainz
  module Utils
    module Album
      MODEL_NAMES = {
        'release' => 'album',
        'release-group' => 'group'
      }.freeze

      include Muffon::Utils::Album

      private

      def title
        album['title']
      end

      def raw_artists
        album['artist-credit']
      end

      def source_data
        {
          name: source_name,
          id: musicbrainz_id,
          model:
            model_name_formatted,
          links: source_links_data
        }
      end

      def musicbrainz_id
        album['id']
      end

      def model_name_formatted
        MODEL_NAMES[
          model_name
        ]
      end

      def original_link
        "https://musicbrainz.org/#{model_name}/#{musicbrainz_id}"
      end

      def image_data
        image_data_formatted(
          album['id'],
          model_name
        )
      end

      def release_date
        date_formatted(
          raw_release_date
        )
      end

      def raw_release_date
        album['date'] ||
          album['first-release-date']
      end

      def raw_tags
        album['tags'].pluck('name')
      end

      def raw_tracks
        album.dig(
          'media',
          0,
          'tracks'
        )
      end
    end
  end
end
