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

        def title
          raw_video_info_data['text']
        end

        def raw_video_info_data
          raw_video_data.dig(
            0, 'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0
          )
        end

        def raw_video_data
          video.dig(
            'musicResponsiveListItemRenderer',
            'flexColumns'
          )
        end

        def video
          @args[:video]
        end

        def youtube_id
          raw_video_info_data.dig(
            'navigationEndpoint',
            'watchEndpoint', 'videoId'
          )
        end

        def channel_youtube_id
          raw_video_channel_data.dig(
            'navigationEndpoint',
            'browseEndpoint', 'browseId'
          )
        end

        def raw_video_channel_data
          raw_video_data.dig(
            1, 'musicResponsiveListItemFlexColumnRenderer',
            'text', 'runs', 0
          )
        end

        def channel_title
          raw_video_channel_data['text']
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
