module YouTube
  module Video
    class Related
      class Video < YouTube::Video::Related
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
          @args[:video][
            'compactVideoRenderer'
          ]
        end

        def title
          video.dig(
            'title', 'simpleText'
          )
        end

        def youtube_id
          video['videoId']
        end

        def channel_youtube_id
          video.dig(
            'longBylineText', 'runs',
            0, 'navigationEndpoint',
            'browseEndpoint', 'browseId'
          )
        end

        def channel_title
          video.dig(
            'longBylineText',
            'runs', 0, 'text'
          )
        end

        def image
          video.dig(
            'thumbnail',
            'thumbnails', 0, 'url'
          )
        end

        def publish_date
          nil
        end
      end
    end
  end
end
