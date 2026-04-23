module MusicBrainz
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['title']
      end

      def raw_artists
        raw_album_data['artist-credit'].map do |raw_artist_data|
          {
            name: raw_artist_data.dig(
              'artist',
              'name'
            ),
            source_id: raw_artist_data.dig(
              'artist',
              'id'
            )
          }
        end
      end

      def musicbrainz_id
        raw_album_data['id']
      end

      def musicbrainz_model
        'album'
      end

      def source_original_link
        "https://musicbrainz.org/release/#{musicbrainz_id}"
      end

      def image_data
        MusicBrainz::Formatter::Image.call(
          image_id: musicbrainz_id,
          album_type: 'release'
        )
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['date']
      end

      def raw_tags
        raw_album_data['tags']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def raw_tracks
        raw_album_data.dig(
          'media',
          0,
          'tracks'
        )
      end

      def raw_labels
        raw_album_data['label-info']
      end

      def label_data_formatted(
        raw_label_data
      )
        raw_label_data.dig(
          'label',
          'name'
        )
      end
    end
  end
end
