module YouTubeMusic
  module Search
    class Videos
      class Video < YouTubeMusic::Search::Videos
        include YouTube::Utils::Video

        def call
          data
        end

        private

        def data
          self_data
            .merge(video_data)
        end

        def video_data
          {
            source: source_data,
            title:,
            channel: channel_data,
            image: image_data
          }
        end

        def video
          @args[:video]
        end

        def title
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'text'
          )
        end

        def youtube_id
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 0,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'navigationEndpoint',
            'watchEndpoint', 'videoId'
          )
        end

        def channel_youtube_id
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'navigationEndpoint',
            'browseEndpoint', 'browseId'
          )
        end

        def channel_title
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns', 1,
            'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0, 'text'
          )
        end

        def image
          video.dig(
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
