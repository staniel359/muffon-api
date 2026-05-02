module Muffon
  module Sendable
    class Video < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_video_data
        ]
      end

      def data
        {
          source: source_data,
          title:,
          channel: video_channel_data,
          image: image_data,
          views_count:,
          publish_date:
        }.compact
      end

      def source_data
        video_record.source_data
      end

      def video_record
        if defined?(@video_record)
          @video_record
        else
          @video_record =
            ::Video.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        video_data[:youtube_id]
      end

      def video_data
        @args[:raw_video_data].deep_symbolize_keys
      end

      def title
        video_record.title
      end

      def video_channel_data
        video_record.video_channel_data
      end

      def image_data
        video_record.image_data
      end

      def views_count
        video_record.views_count
      end

      def publish_date
        video_record.publish_date
      end
    end
  end
end
