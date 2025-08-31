module YouTubeMusic
  module Search
    class Videos
      class Video < YouTubeMusic::Search::Videos
        include YouTubeMusic::Utils::Video

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
            channel: channel_data,
            image: image_data
          }
        end

        def video
          @args[:video]
        end
      end
    end
  end
end
