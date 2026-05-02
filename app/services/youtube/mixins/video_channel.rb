module YouTube
  module Mixins
    module VideoChannel
      include Muffon::Mixins::VideoChannel

      private

      def title
        CGI.unescapeHTML(
          raw_title
        )
      end

      def raw_title
        raw_video_channel_data.dig(
          'snippet',
          'title'
        )
      end

      def youtube_id
        raw_video_channel_data['id']
      end

      def source_original_link
        "https://www.youtube.com/channel/#{youtube_id}"
      end

      def image_data
        YouTube::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_video_channel_data.dig(
          'snippet',
          'thumbnails',
          'default',
          'url'
        )
      end

      def description
        return if raw_description.blank?

        CGI.unescapeHTML(
          raw_description
        )
      end

      def raw_description
        raw_video_channel_data.dig(
          'snippet',
          'description'
        )
      end

      def views_count
        return if raw_views_count.blank?

        raw_views_count.to_i
      end

      def raw_views_count
        raw_video_channel_data.dig(
          'statistics',
          'viewCount'
        )
      end

      def subscribers_count
        return if raw_subscribers_count.blank?

        raw_subscribers_count.to_i
      end

      def raw_subscribers_count
        raw_video_channel_data.dig(
          'statistics',
          'subscriberCount'
        )
      end

      def videos_count
        return if raw_videos_count.blank?

        raw_videos_count.to_i
      end

      def raw_videos_count
        raw_video_channel_data.dig(
          'statistics',
          'videoCount'
        )
      end

      def publish_date
        datetime_formatted(
          raw_publish_date.to_datetime
        )
      end

      def raw_publish_date
        raw_video_channel_data.dig(
          'snippet',
          'publishedAt'
        )
      end

      def update_record_data!
        video_channel_record.update!(
          record_attributes
        )
      end

      def record_attributes
        {
          title:,
          image_url:,
          videos_count:,
          views_count:,
          subscribers_count:,
          publish_date:
        }.compact
      end
    end
  end
end
