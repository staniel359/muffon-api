module Muffon
  module Utils
    module Video
      private

      def find_video
        @find_video ||=
          ::Video.where(
            youtube_id:
          ).first_or_initialize.tap do |v|
            v.attributes = update_params

            v.save
          end
      end

      def youtube_id
        @args[:youtube_id]
      end

      def update_params
        {
          title:,
          channel_youtube_id:,
          channel_title:,
          image_url: image,
          publish_date:
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
