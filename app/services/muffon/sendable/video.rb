module Muffon
  module Sendable
    class Video < YouTube::Base
      include YouTube::Utils::Video

      def call
        data
      end

      private

      def data
        {
          source: source_data,
          title:,
          channel: channel_data,
          image: image_data,
          views_count:,
          publish_date:
        }.compact
      end

      def title
        find_video.title
      end

      def find_video
        if instance_variable_defined?(
          :@find_video
        )
          @find_video
        else
          @find_video =
            ::Video.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        video['youtube_id']
      end

      def video
        @args[:video]
      end

      def channel_youtube_id
        find_video.channel_youtube_id
      end

      def channel_title
        find_video.channel_title
      end

      def image
        find_video.image_url
      end

      def views_count
        find_video.views_count
      end

      def raw_publish_date
        find_video
          .created_at
          .to_s
      end
    end
  end
end
