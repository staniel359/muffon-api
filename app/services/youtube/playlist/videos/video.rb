module YouTube
  module Playlist
    class Videos
      class Video < YouTube::Playlist::Videos
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
          self_data
            .merge(video_data)
        end

        def video_data
          {
            source: source_data,
            title:,
            image: image_data,
            publish_date:
          }.compact
        end

        def video
          @args[:video]
        end

        def youtube_id
          snippet.dig(
            'resourceId',
            'videoId'
          )
        end
      end
    end
  end
end
