module Muffon
  module Sendable
    class VideoChannel < YouTube::Base
      include YouTube::Mixins::VideoChannel

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

      def video_channel_record
        if instance_variable_defined?(
          :@video_channel_record
        )
          @video_channel_record
        else
          @video_channel_record =
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
        video_channel_record.title
      end

      def image_data
        image_data_formatted(
          image:
        )
      end

      def image
        video_channel_record.image_url
      end

      def videos_count
        video_channel_record.videos_count
      end

      def subscribers_count
        video_channel_record.subscribers_count
      end

      def raw_publish_date
        video_channel_record
          .created_at
          .to_s
      end
    end
  end
end
