module YouTube
  module Mixins
    module Video
      include Muffon::Mixins::Video
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        CGI.unescapeHTML(
          raw_title
        )
      end

      def raw_title
        raw_video_data.dig(
          'snippet',
          'title'
        )
      end

      def youtube_id
        raw_video_data['id']
      end

      def source_original_link
        "https://www.youtube.com/watch?v=#{youtube_id}"
      end

      def channel_title
        if raw_channel_title.present?
          CGI.unescapeHTML(
            raw_channel_title
          )
        else
          'Unknown Channel'
        end
      end

      def raw_channel_title
        raw_video_data.dig(
          'snippet',
          'channelTitle'
        )
      end

      def channel_youtube_id
        raw_video_data.dig(
          'snippet',
          'channelId'
        )
      end

      def image_data
        YouTube::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_video_data.dig(
          'snippet',
          'thumbnails',
          'default',
          'url'
        )
      end

      def creation_date
        return if raw_creation_date.blank?

        Muffon::Formatter::Date.call(
          date: raw_creation_date
        )
      end

      def raw_creation_date
        raw_video_data.dig(
          'snippet',
          'publishedAt'
        )
      end

      def description
        return if raw_description.blank?

        CGI.unescapeHTML(
          raw_description
        )
      end

      def raw_description
        raw_video_data.dig(
          'snippet',
          'description'
        )
      end

      def raw_tags
        raw_video_data.dig(
          'snippet',
          'tags'
        ) || []
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data
      end

      def views_count
        return if raw_views_count.blank?

        raw_views_count.to_i
      end

      def raw_views_count
        raw_video_data.dig(
          'statistics',
          'viewCount'
        )
      end

      def likes_count
        return if raw_likes_count.blank?

        raw_likes_count.to_i
      end

      def raw_likes_count
        raw_video_data.dig(
          'statistics',
          'likeCount'
        )
      end

      def dislikes_count
        return if raw_dislikes_count.blank?

        raw_dislikes_count.to_i
      end

      def raw_dislikes_count
        raw_video_data.dig(
          'statistics',
          'dislikeCount'
        )
      end

      def update_record_data!
        video_record.update!(
          record_attributes
        )
      end

      def record_attributes
        {
          title:,
          channel_youtube_id:,
          channel_title:,
          image_url:,
          views_count:,
          created_at: creation_date
        }.compact
      end
    end
  end
end
