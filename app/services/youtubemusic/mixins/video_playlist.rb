module YouTubeMusic
  module Mixins
    module VideoPlaylist
      private

      def title
        raw_playlist_data.dig(
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
        raw_playlist_data.dig(
          'musicResponsiveListItemRenderer',
          'overlay',
          'musicItemThumbnailOverlayRenderer',
          'content',
          'musicPlayButtonRenderer',
          'playNavigationEndpoint',
          'watchPlaylistEndpoint',
          'playlistId'
        )
      end

      def source_original_link
        "https://music.youtube.com/playlist?list=#{youtube_id}"
      end

      def channel_title
        raw_playlist_data.dig(
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

      def channel_youtube_id
        raw_playlist_data.dig(
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

      def image_data
        YouTubeMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_playlist_data.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          0,
          'url'
        )
      end

      def views_count
        human_number_to_number(
          raw_views_count
        )
      end

      def raw_views_count
        find_raw_views_count(
          raw_playlist_data.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          )
        )
      end

      def videos_count
        human_number_to_number(
          raw_videos_count
        )
      end

      def raw_videos_count
        find_raw_videos_count(
          raw_playlist_data.dig(
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
