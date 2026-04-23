module SoundCloud
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['title']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_track_data.dig(
            'user',
            'username'
          ),
          source_id: raw_track_data.dig(
            'user',
            'id'
          )
        }
      end

      def soundcloud_id
        raw_track_data['id']
      end

      def source_original_link
        raw_track_data['permalink_url']
      end

      def image_data
        SoundCloud::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data['artwork_url']
      end

      def duration
        return if raw_duration.blank?

        raw_duration / 1_000
      end

      def raw_duration
        raw_track_data['duration']
      end

      def audio_present?
        raw_track_data['streamable']
      end

      def description
        raw_track_data['description']
      end

      def raw_tags
        [raw_track_data['genre']].compact_blank
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data
      end

      def audio_link
        return if @args[:with_audio].blank?

        SoundCloud::Utils::Track::Audio::Link.call(
          raw_track_data:
        )
      end
    end
  end
end
