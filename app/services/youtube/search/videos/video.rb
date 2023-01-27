module YouTube
  module Search
    class Videos
      class Video < YouTube::Search::Videos
        include YouTube::Utils::Video

        def call
          data
        end

        private

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
            'id', 'videoId'
          )
        end
      end
    end
  end
end
