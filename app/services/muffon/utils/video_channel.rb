module Muffon
  module Utils
    module VideoChannel
      private

      def video_channel_record
        @video_channel_record ||=
          ::VideoChannel.with_youtube_id(
            youtube_id:,
            title:
          )
      end

      def self_data
        Muffon::Self.call(
          **self_args,
          model: 'video_channel',
          model_id: video_channel_record.id
        )
      end
    end
  end
end
