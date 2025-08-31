module Muffon
  module Utils
    module VideoChannel
      private

      def find_video_channel
        @find_video_channel ||=
          ::VideoChannel.with_youtube_id(
            youtube_id:,
            update_attributes:
          )
      end

      def youtube_id
        @args[:youtube_id]
      end

      def update_attributes
        {
          title:,
          image_url: image,
          videos_count:,
          subscribers_count:,
          views_count:,
          created_at: publish_date
        }.compact
      end

      def title
        nil
      end

      def image
        nil
      end

      def videos_count
        nil
      end

      def subscribers_count
        nil
      end

      def views_count
        nil
      end

      def publish_date
        nil
      end

      def self_data
        Muffon::Self.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          model: 'video_channel',
          model_id: video_channel_id
        )
      end

      def video_channel_id
        find_video_channel.id
      end
    end
  end
end
