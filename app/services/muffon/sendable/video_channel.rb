module Muffon
  module Sendable
    class VideoChannel < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_video_channel_data
        ]
      end

      def data
        {
          source: source_data,
          title:,
          image: image_data,
          videos_count:,
          subscribers_count:,
          publish_date: creation_date
        }.compact
      end

      def source_data
        video_channel_record.source_data
      end

      def video_channel_record
        if defined?(@video_channel_record)
          @video_channel_record
        else
          @video_channel_record =
            ::VideoChannel.find_by(
              youtube_id:
            )
        end
      end

      def youtube_id
        video_channel_data[:youtube_id]
      end

      def video_channel_data
        @args[:raw_video_channel_data].deep_symbolize_keys
      end

      def title
        video_channel_record.title
      end

      def image_data
        video_channel_record.image_data
      end

      def videos_count
        video_channel_record.videos_count
      end

      def subscribers_count
        video_channel_record.subscribers_count
      end

      def creation_date
        datetime_formatted(
          raw_creation_date
        )
      end

      def raw_creation_date
        video_channel_record.created_at
      end
    end
  end
end
