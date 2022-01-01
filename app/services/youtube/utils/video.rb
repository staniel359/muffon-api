module YouTube
  module Utils
    module Video
      private

      def title
        CGI.unescapeHTML(
          snippet['title']
        )
      end

      def snippet
        @snippet ||= video['snippet']
      end

      def channel_data
        {
          title: channel_title,
          youtube_id: channel_youtube_id
        }
      end

      def channel_title
        snippet['channelTitle']
      end

      def channel_youtube_id
        snippet['channelId']
      end

      def image_data_formatted
        YouTube::Utils::Image.call(
          image:
        )
      end

      def image
        snippet.dig(
          'thumbnails',
          'default',
          'url'
        )
      end

      def publish_date
        date_formatted(
          snippet['publishedAt']
        )
      end
    end
  end
end
