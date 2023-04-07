module YouTubeMusic
  module Search
    class Playlists
      class Playlist < YouTubeMusic::Search::Playlists
        include YouTube::Utils::Playlist

        def call
          data
        end

        private

        def data
          self_data
            .merge(playlist_data)
        end

        def playlist_data
          {
            source: source_data,
            title:,
            channel: channel_data,
            image: image_data
          }
        end

        def playlist
          @args[:playlist]
        end

        def title
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'text'
          )
        end

        def youtube_id
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'overlay', 'musicItemThumbnailOverlayRenderer',
            'content', 'musicPlayButtonRenderer',
            'playNavigationEndpoint',
            'watchPlaylistEndpoint', 'playlistId'
          )
        end

        def channel_youtube_id
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'navigationEndpoint',
            'browseEndpoint', 'browseId'
          )
        end

        def channel_title
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'text'
          )
        end

        def image
          playlist.dig(
            'musicResponsiveListItemRenderer',
            'thumbnail', 'musicThumbnailRenderer',
            'thumbnail', 'thumbnails', 0, 'url'
          )
        end

        def publish_date
          nil
        end
      end
    end
  end
end
