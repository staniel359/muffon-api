module YouTube
  module Utils
    module Video
      include Muffon::Utils::Video

      private

      def title
        CGI.unescapeHTML(
          raw_title
        )
      end

      def raw_title
        snippet['title']
      end

      def snippet
        video['snippet']
      end

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links_data
        }
      end

      def youtube_id
        video['id']
      end

      def original_link
        "https://www.youtube.com/watch?v=#{youtube_id}"
      end

      def streaming_link
        streaming_link_formatted(
          model: 'video',
          model_id: youtube_id
        )
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
        }.compact
      end

      def channel_youtube_id
        snippet['channelId']
      end

      def channel_title
        CGI.unescapeHTML(
          raw_channel_title
        )
      end

      def raw_channel_title
        snippet['channelTitle']
      end

      def image_data
        image_data_formatted(
          images:,
          model: 'video'
        )
      end

      def images
        snippet['thumbnails']
      end

      def publish_date
        date_formatted(
          raw_publish_date
        )
      end

      def raw_publish_date
        snippet['publishedAt']
      end

      def description
        return if raw_description.blank?

        CGI.unescapeHTML(
          raw_description
        )
      end

      def raw_description
        snippet['description'].presence
      end

      def raw_tags
        snippet['tags']
      end
    end
  end
end
