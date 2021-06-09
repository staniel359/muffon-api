module YouTube
  module Video
    class Info < YouTube::Video::Base
      private

      def video_data
        base_data
          .merge(extra_data)
          .merge(with_more_data)
      end

      def base_data
        {
          title: title,
          youtube_id: youtube_id,
          channel: channel_data
        }
      end

      def title
        snippet['title']
      end

      def youtube_id
        video['id']
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

      def extra_data
        {
          image: image_data_formatted,
          views_count: views_count,
          likes_count: likes_count,
          dislikes_count: dislikes_count,
          publish_date: publish_date,
          description: description_truncated,
          tags: tags.first(5)
        }
      end

      def views_count
        statistics['viewCount'].to_i
      end

      def statistics
        @statistics ||= video['statistics']
      end

      def likes_count
        statistics['likeCount'].to_i
      end

      def dislikes_count
        statistics['dislikeCount'].to_i
      end

      def publish_date
        date_formatted(
          snippet['publishedAt']
        )
      end
    end
  end
end
