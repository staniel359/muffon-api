module AmazonMusic
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection
      include AmazonMusic::Mixins::Base

      private

      def title
        raw_track_data.dig(
          'primaryText',
          'text'
        )
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: artist_name,
          source_id: artist_amazonmusic_id
        }
      end

      def artist_name
        raw_track_data['secondaryText']
      end

      def artist_amazonmusic_id
        artist_amazonmusic_slug.match(
          %r{artists/(.+)/}
        )[1]
      end

      def artist_amazonmusic_slug
        raw_track_data.dig(
          'secondaryLink',
          'deeplink'
        )
      end

      def amazonmusic_id
        amazonmusic_slug.match(
          /trackAsin=(\w+)/
        )[1]
      end

      def amazonmusic_slug
        raw_track_data.dig(
          'primaryLink',
          'deeplink'
        )
      end

      def source_original_link
        "#{WEB_BASE_URL}#{amazonmusic_slug}"
      end

      def album_title
        raw_track_data.dig(
          'contextMenu',
          'options',
          0,
          'onItemSelected',
          1,
          'template',
          'headerText',
          'text'
        )
      end

      def album_amazonmusic_id
        amazonmusic_slug.match(
          %r{(?:albums|playlists)/(.+)\?}
        )[1]
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data['image']
      end

      def audio_present?
        true
      end

      def audio_link
        return if @args[:with_audio].blank?

        AmazonMusic::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def duration
        duration_string_to_seconds(
          raw_duration
        )
      end

      def raw_duration
        raw_track_data['secondaryText3']
      end
    end
  end
end
