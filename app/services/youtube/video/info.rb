module YouTube
  module Video
    class Info < YouTube::Video::Base
      private

      def video_data
        self_data
          .merge(super)
          .merge(video_artist_data)
          .merge(video_statistics_data)
          .merge(video_extra_data)
          .merge(with_more_data)
      end

      def video_artist_data
        {
          artist: artist_info_data
        }.compact
      end

      def artist_info_data
        YouTube::Video::Info::Artist.call(
          channel_title:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      def video_statistics_data
        {
          views_count:,
          likes_count:,
          dislikes_count:
        }
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

      def video_extra_data
        {
          image: image_data,
          publish_date:,
          description:
            description_truncated,
          tags: tags_truncated
        }.compact
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
