module YouTube
  module Utils
    module Video
      include Muffon::Utils::Video

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
          title: channel_title
        }
      end

      def channel_source_data
        {
          name: source_name,
          id: channel_youtube_id
        }
      end

      def channel_youtube_id
        snippet['channelId']
      end

      def channel_title
        snippet['channelTitle']
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
          raw_publish_date
        )
      end

      def raw_publish_date
        snippet['publishedAt']
      end
    end
  end
end
