module Muffon
  module Sendable
    class VideoChannel < YouTube::Base
      include YouTube::Utils::Channel

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          channel
        ]
      end

      def data
        {
          source: source_data,
          title:,
          image: image_data,
          videos_count:,
          subscribers_count:,
          publish_date:
        }.compact
      end

      def find_video_channel
        if instance_variable_defined?(
          :@find_video_channel
        )
          @find_video_channel
        else
          @find_video_channel =
            ::VideoChannel.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        channel['youtube_id']
      end

      def channel
        @args[:channel]
      end

      def title
        find_video_channel.title
      end

      def image_data
        image_data_formatted(
          image:
        )
      end

      def image
        find_video_channel.image_url
      end

      def videos_count
        find_video_channel.videos_count
      end

      def subscribers_count
        find_video_channel.subscribers_count
      end

      def raw_publish_date
        find_video_channel
          .created_at
          .to_s
      end
    end
  end
end
