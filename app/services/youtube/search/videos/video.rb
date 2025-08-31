module YouTube
  module Search
    class Videos
      class Video < YouTube::Search::Videos
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
          return if snippet.blank?

          self_data
            .merge(video_data)
        end

        def video_data
          {
            source: source_data,
            title:,
            channel: channel_data,
            image: image_data,
            publish_date:
          }.compact
        end

        def video
          @args[:video]
        end

        def youtube_id
          video.dig(
            'id',
            'videoId'
          )
        end

        def image_data
          image_data_formatted(
            images:,
            model: 'search_video'
          )
        end
      end
    end
  end
end
