module YouTubeMusic
  module Utils
    module Playlist
      include Muffon::Utils::VideoPlaylist

      private

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links_data
        }
      end

      def youtube_id
        playlist.dig(
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

      def original_link
        "https://music.youtube.com/playlist?list=#{youtube_id}"
      end

      def title
        playlist.dig(
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

      def channel_data
        {
          source: channel_source_data,
          title: channel_title
        }
      end

      def channel_source_data
        {
          name: source_name,
          id: channel_youtube_id
        }.compact
      end

      def channel_youtube_id
        playlist.dig(
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

      def channel_title
        playlist.dig(
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

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        playlist.dig(
          'musicResponsiveListItemRenderer',
          'thumbnail',
          'musicThumbnailRenderer',
          'thumbnail',
          'thumbnails',
          0,
          'url'
        )
      end

      def raw_views_count
        find_raw_views_count(
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns',
            1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text',
            'runs'
          )
        )
      end

      def raw_videos_count
        find_raw_videos_count(
          playlist.dig(
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
