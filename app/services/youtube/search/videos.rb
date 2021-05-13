module YouTube
  module Search
    class Videos < YouTube::Base
      private

      def no_data?
        videos_list.blank?
      end

      def videos_list
        response_data['items']
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          next_page: response_data['nextPageToken'],
          videos: videos_data
        }
      end

      def videos_data
        videos_list.map { |v| video_data(v) }
      end

      def video_data(video)
        {
          title: title(video),
          youtube_id: video.dig('id', 'videoId'),
          channel: channel_data(video),
          image: image_data(video),
          published: published(video),
          description: description(video)
        }
      end

      def title(video)
        CGI.unescapeHTML(video.dig('snippet', 'title'))
      end

      def channel_data(video)
        {
          title: video.dig('snippet', 'channelTitle'),
          youtube_id: video.dig('snippet', 'channelId')
        }
      end

      def image_data(video)
        {
          large: image(video, 'high'),
          medium: image(video, 'medium'),
          small: image(video, 'default')
        }
      end

      def image(video, size)
        video.dig('snippet', 'thumbnails', size, 'url')
      end

      def published(video)
        date_formatted(video.dig('snippet', 'publishedAt'))
      end

      def description(video)
        CGI.unescapeHTML(video.dig('snippet', 'description'))
      end
    end
  end
end
