module LastFM
  module Mixins
    module Track
      include Muffon::Utils::Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['name']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        { name: artist_name }
      end

      def artist_name
        raw_track_data.dig(
          'artist',
          'name'
        )
      end

      def source_original_link
        "https://www.last.fm/music/#{CGI.escape(artist_name)}/_/#{CGI.escape(title)}"
      end

      def duration
        return if raw_duration.blank?

        raw_duration.to_i
      end

      def raw_duration
        raw_track_data['duration']
      end

      def listeners_count
        return if raw_listeners_count.blank?

        raw_listeners_count.to_i
      end

      def raw_listeners_count
        raw_track_data['listeners']
      end

      def plays_count
        return if raw_plays_count.blank?

        raw_plays_count.to_i
      end

      def raw_plays_count
        raw_track_data['playcount']
      end

      def description
        LastFM::Formatter::Description.call(
          description: raw_description
        )
      end

      def raw_description
        raw_track_data.dig(
          'wiki',
          'content'
        )
      end

      def raw_tags
        raw_track_data.dig(
          'toptags',
          'tag'
        )
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def album_title
        raw_album_data.try(:[], 'title')
      end

      def raw_album_data
        raw_track_data['album']
      end

      def image_data
        LastFM::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data.dig(
          'image',
          -1,
          '#text'
        ) || album_image_url
      end

      def album_image_url
        return if raw_album_data.blank?

        raw_album_data.dig(
          'image',
          -1,
          '#text'
        )
      end

      def creation_date
        datetime_formatted(
          raw_creation_date
        )
      end

      def raw_creation_date
        raw_track_data
          .dig(
            'date',
            '#text'
          )
          .to_datetime
      end

      def update_record_data!
        track_record.update!(
          record_attributes
        )
      end

      def record_attributes
        {
          listeners_count:
        }.compact
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
