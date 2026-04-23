module Muffon
  module Sendable
    class Video < YouTube::Base
      include YouTube::Mixins::Video

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          video
        ]
      end

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
        video_record.title
      end

      def video_record
        if instance_variable_defined?(
          :@video_record
        )
          @video_record
        else
          @video_record =
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
        video_record.channel_youtube_id
      end

      def channel_title
        video_record.channel_title
      end

      def image_data
        image_data_formatted(
          image:
        )
      end

      def image
        video_record.image_url
      end

      def views_count
        video_record.views_count
      end

      def raw_publish_date
        video_record
          .created_at
          .to_s
      end
    end
  end
end
