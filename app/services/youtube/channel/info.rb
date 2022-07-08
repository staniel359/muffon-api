module YouTube
  module Channel
    class Info < YouTube::Channel::Base
      private

      def channel_data
        {
          source: source_data,
          title:,
          description:,
          image: image_data,
          statistics: statistics_data,
          created: created_formatted
        }
      end

      def source_data
        {
          name: source_name,
          id: youtube_id
        }
      end

      def youtube_id
        channel['id']
      end

      def description
        CGI.unescapeHTML(
          snippet['description']
        )
      end

      def image_data
        {
          original: image_resized(''),
          large: image_resized('s600'),
          medium: image_resized('s300'),
          small: image_resized('s100'),
          extrasmall: image_resized('s50')
        }
      end

      def image_resized(size)
        image.sub(
          's88', size
        )
      end

      def image
        snippet.dig(
          'thumbnails',
          'default',
          'url'
        )
      end

      def statistics_data
        {
          views_count:
            statistics['viewCount'].to_i,
          subscribers_count:
            statistics['subscriberCount'].to_i,
          videos_count:
            statistics['videoCount'].to_i
        }
      end

      def statistics
        channel['statistics']
      end

      def created_formatted
        date_formatted(
          snippet['publishedAt']
        )
      end
    end
  end
end
