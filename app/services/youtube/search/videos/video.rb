module YouTube
  module Search
    class Videos
      class Video < YouTube::Search::Videos
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
            publish_date: publish_date,
            description: description
          }
        end

        def title
          CGI.unescapeHTML(snippet['title'])
        end

        def snippet
          @snippet ||= @args.video['snippet']
        end

        def youtube_id
          @args.video.dig('id', 'videoId')
        end

        def channel_data
          {
            title: snippet['channelTitle'],
            youtube_id: snippet['channelId']
          }
        end

        def publish_date
          date_formatted(
            snippet['publishedAt']
          )
        end

        def description
          CGI.unescapeHTML(
            snippet['description']
          )
        end
      end
    end
  end
end
