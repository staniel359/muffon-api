module MusicBrainz
  module Mixins
    module AlbumGroup
      include Muffon::Mixins::Formatting::Collection

      def title
        raw_album_group_data['title']
      end

      def raw_artists
        raw_album_group_data['artist-credit'].map do |raw_artist_data|
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
        raw_album_group_data['id']
      end

      def musicbrainz_model
        'group'
      end

      def source_original_link
        "https://musicbrainz.org/release-group/#{musicbrainz_id}"
      end

      def image_data
        MusicBrainz::Formatter::Image.call(
          image_id: musicbrainz_id,
          album_type: 'release-group'
        )
      end

      def release_date
        return if raw_release_date.blank?

        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_group_data['first-release-date']
      end

      def raw_tags
        raw_album_group_data['tags']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end
    end
  end
end
