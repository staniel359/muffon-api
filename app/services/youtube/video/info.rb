module YouTube
  module Video
    class Info < YouTube::Video::Base
      private

      def video_data
        {
          **self_data,
          **super,
          artist: artist_info_data,
          views_count:,
          likes_count:,
          dislikes_count:,
          image: image_data,
          publish_date:,
          description:
            description_truncated,
          tags: tags_truncated
        }.compact
      end

      def artist_info_data
        @artist_info_data ||=
          YouTube::Video::Info::Artist.call(
            channel_title:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
      end

      def views_count
        statistics['viewCount'].to_i
      end

      def statistics
        video['statistics']
      end

      def likes_count
        statistics['likeCount'].to_i
      end

      def dislikes_count
        statistics['dislikeCount'].to_i
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end
    end
  end
end
