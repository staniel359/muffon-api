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

      def source_data
        {
          name: source_name,
          id: youtube_id
        }
      end

      def youtube_id
        video['id']
      end

      def channel_data
        {
          source: channel_source_data,
          title: snippet['channelTitle']
        }
      end

      def channel_source_data
        {
          name: source_name,
          id: snippet['channelId']
        }
      end

      def image_data
        image_data_formatted(
          image
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
