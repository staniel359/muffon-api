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
        video['snippet']
      end

      def channel_data
        {
          title: snippet['channelTitle'],
          youtube_id: snippet['channelId']
        }
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
