module MusicBrainz
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['title']
      end

      def artist_name
        raw_artists.pluck(:name).join(', ')
      end

      def raw_artists
        raw_track_data['artist-credit'].map do |raw_artist_data|
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
        raw_track_data['id']
      end

      def source_original_link
        "https://musicbrainz.org/recording/#{musicbrainz_id}"
      end

      def album_title
        raw_album_data['title']
      end

      def raw_album_data
        raw_albums[0]
      end

      def raw_albums
        raw_track_data['releases']
      end

      def album_musicbrainz_id
        raw_album_data['id']
      end

      def raw_albums_distinct
        raw_albums.uniq do |album_data|
          album_data['title']
        end
      end

      def image_data
        return if raw_album_data.blank?

        MusicBrainz::Formatter::Image.call(
          image_id: album_musicbrainz_id,
          album_type: 'release'
        )
      end

      def duration
        return if raw_duration.blank?

        raw_duration / 1_000
      end

      def raw_duration
        raw_track_data['length']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_track_data['first-release-date']
      end

      def raw_tags
        raw_track_data['tags']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def audio_present?
        false
      end

      def audio_link
        nil
      end
    end
  end
end
