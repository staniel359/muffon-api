module YouTube
  module Utils
    module Channel
      include Muffon::Utils::VideoChannel

      private

      def source_data
        {
          name: source_name,
          id: youtube_id,
          links: source_links_data
        }
      end

      def youtube_id
        channel['id']
      end

      def original_link
        "https://www.youtube.com/channel/#{youtube_id}"
      end

      def title
        CGI.unescapeHTML(
          raw_title
        )
      end

      def raw_title
        snippet['title']
      end

      def snippet
        channel['snippet']
      end

      def image_data
        image_data_formatted(
          images:,
          model: 'channel'
        )
      end

      def images
        snippet['thumbnails']
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

      def views_count
        statistics['viewCount'].to_i
      end

      def statistics
        channel['statistics']
      end

      def subscribers_count
        statistics['subscriberCount'].to_i
      end

      def videos_count
        statistics['videoCount'].to_i
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
