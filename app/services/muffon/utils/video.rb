module Muffon
  module Utils
    module Video
      private

      def find_video
        @find_video ||=
          ::Video.with_youtube_id(
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
          channel_youtube_id:,
          channel_title:,
          views_count:,
          image_url: image,
          created_at: publish_date
        }.compact
      end

      def title
        nil
      end

      def channel_youtube_id
        nil
      end

      def channel_title
        nil
      end

      def views_count
        nil
      end

      def image
        nil
      end

      def publish_date
        nil
      end

      def self_data
        Muffon::Self.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          model: 'video',
          model_id: video_id
        )
      end

      def video_id
        find_video.id
      end
    end
  end
end
