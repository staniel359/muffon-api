module YouTubeMusic
  module Utils
    module Track
      include Muffon::Utils::Track

      private

      def title
        raw_track_data.dig(
          'title',
          'runs',
          0,
          'text'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'text'
          )
      end

      def raw_artists
        @raw_artists ||=
          find_raw_artists_data(
            raw_track_data.dig(
              'longBylineText',
              'runs'
            ) ||
            raw_track_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            ) ||
            []
          ).presence ||
          [
            raw_track_data.dig(
              'longBylineText',
              'runs',
              0
            )
          ].compact
      end

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links_data
        }
      end

      def youtube_id
        raw_track_data['videoId'] ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'navigationEndpoint',
            'watchEndpoint',
            'videoId'
          )
      end

      def original_link
        "https://music.youtube.com/watch?v=#{youtube_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'video',
          model_id: youtube_id
        )
      end

      def albums
        [album_data]
      end

      def album_data
        return if raw_album_data.blank?

        {
          source: album_source_data,
          title: album_title
        }
      end

      def raw_album_data
        @raw_album_data ||=
          find_raw_album_data(
            raw_track_data.dig(
              'longBylineText',
              'runs'
            ) ||
            raw_track_data.dig(
              'musicResponsiveListItemRenderer',
              'flexColumns',
              1,
              'musicResponsiveListItemFlexColumnRenderer',
              'text',
              'runs'
            ) ||
            []
          )
      end

      def album_source_data
        {
          name: source_name,
          id: album_youtube_id
        }
      end

      def album_youtube_id
        raw_album_data.dig(
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        )
      end

      def album_title
        raw_album_data['text']
      end

      def image_data
        image_data_formatted(
          image_link
        )
      end

      def image_link
        raw_track_data.dig(
          'thumbnail',
          'thumbnails',
          -1,
          'url'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'thumbnail',
            'musicThumbnailRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
      end

      def duration
        duration_string_to_seconds(
          raw_duration
        )
      end

      def raw_duration
        find_raw_duration(
          raw_track_data.dig(
            'lengthText',
            'runs'
          ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'fixedColumns',
            0,
            'musicResponsiveListItemFixedColumnRenderer',
            'text',
            'runs'
          ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          )
        )
      end

      def audio_present?
        true
      end

      def audio_link
        YouTubeMusic::Utils::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end

      def album_release_date
        date_formatted(
          raw_album_release_date
        )
      end

      def raw_album_release_date
        raw_track_data.dig(
          'longBylineText',
          'runs',
          4,
          'text'
        )
      end

      def plays_count
        human_number_to_number(
          raw_plays_count
        )
      end

      def raw_plays_count
        find_raw_plays_count(
          raw_track_data.dig(
            'longBylineText',
            'runs'
          )
        )
      end
    end
  end
end
