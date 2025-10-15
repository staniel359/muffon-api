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

      def artist_name
        raw_track_data.dig(
          'longBylineText',
          'runs',
          0,
          'text'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'text'
          )
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
          id: artist_youtube_id
        }
      end

      def artist_youtube_id
        raw_track_data.dig(
          'longBylineText',
          'runs',
          0,
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            0,
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
      end

      def albums
        [album_data]
      end

      def album_data
        {
          source: album_source_data,
          title: album_title
        }
      end

      def album_source_data
        {
          name: source_name,
          id: album_youtube_id
        }
      end

      def album_youtube_id
        raw_track_data.dig(
          'longBylineText',
          'runs',
          2,
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            2,
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
      end

      def album_title
        raw_track_data.dig(
          'longBylineText',
          'runs',
          2,
          'text'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            2,
            'text'
          )
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
        raw_track_data.dig(
          'lengthText',
          'runs',
          0,
          'text'
        ) ||
          raw_track_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs',
            4,
            'text'
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
    end
  end
end
