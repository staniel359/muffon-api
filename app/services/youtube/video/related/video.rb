module YouTube
  module Video
    class Related
      class Video < YouTube::Video::Related
        include YouTube::Utils::Video

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            video
          ]
        end

        def data
          {
            **self_data,
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
            'playlistPanelVideoRenderer',
            'title',
            'runs',
            0,
            'text'
          )
        end

        def youtube_id
          video.dig(
            'playlistPanelVideoRenderer',
            'navigationEndpoint',
            'watchEndpoint',
            'videoId'
          )
        end

        def channel_youtube_id
          video.dig(
            'playlistPanelVideoRenderer',
            'longBylineText',
            'runs',
            0,
            'navigationEndpoint',
            'browseEndpoint',
            'browseId'
          )
        end

        def channel_title
          video.dig(
            'playlistPanelVideoRenderer',
            'longBylineText',
            'runs',
            0,
            'text'
          )
        end

        def image_data
          image_data_formatted(
            image:
          )
        end

        def image
          video.dig(
            'playlistPanelVideoRenderer',
            'thumbnail',
            'thumbnails',
            -1,
            'url'
          )
        end

        def publish_date
          nil
        end
      end
    end
  end
end
