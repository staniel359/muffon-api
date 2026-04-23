module Muffon
  module Utils
    module Video
      private

      def video_record
        @video_record ||=
          ::Video.with_youtube_id(
            youtube_id:,
            title:,
            channel_title:
          )
      end

      def self_data
        Muffon::Self.call(
          **self_args,
          model: 'video',
          model_id: video_record.id
        )
      end
    end
  end
end
