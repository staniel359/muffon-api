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
          {
            title: title,
            youtube_id: youtube_id,
            channel: channel_data,
            image: image_data_formatted,
            publish_date: publish_date
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
