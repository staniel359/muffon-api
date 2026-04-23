module YouTubeMusic
  module Mixins
    module Video
      private

      def title
        raw_video_data.dig(
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

      def youtube_id
        raw_video_data.dig(
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

      def source_original_link
        "https://music.youtube.com/watch?v=#{youtube_id}"
      end

      def channel_title
        raw_channel_data['text']
      end

      def raw_channel_data
        raw_video_data.dig(
          'musicResponsiveListItemRenderer',
          'flexColumns',
          1,
          'musicResponsiveListItemFlexColumnRenderer',
          'text',
          'runs',
          0
        )
      end

      def channel_youtube_id
        raw_channel_data.dig(
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        )
      end

      def image_data
        YouTubeMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_video_data.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          0,
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
          raw_video_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          )
        )
      end

      def views_count
        human_number_to_number(
          raw_views_count
        )
      end

      def raw_views_count
        find_raw_views_count(
          raw_video_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          )
        )
      end
    end
  end
end
