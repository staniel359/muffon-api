module YouTube
  module Video
    class Info < YouTube::Video::Base
      private

      def video_data
        video_base_data
          .merge(video_extra_data)
          .merge(with_more_data)
      end

      def video_extra_data
        {
          image: image_data_formatted,
          views_count:,
          likes_count:,
          dislikes_count:,
          publish_date:,
          description: description_truncated,
          tags: tags&.first(5)
        }.compact
      end

      def views_count
        statistics['viewCount'].to_i
      end

      def statistics
        @statistics ||=
          video['statistics']
      end

      def likes_count
        statistics['likeCount'].to_i
      end

      def dislikes_count
        statistics['dislikeCount'].to_i
      end

      def description
        CGI.unescapeHTML(
          snippet['description']
        )
      end

      def tags_list
        snippet['tags'] || []
      end
    end
  end
end
