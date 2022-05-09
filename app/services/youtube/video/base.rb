module YouTube
  module Video
    class Base < YouTube::Base
      include YouTube::Utils::Video

      private

      def primary_args
        [@args[:video_id]]
      end

      def no_data?
        video.blank?
      end

      def video
        videos_list[0]
      end

      def link
        "#{BASE_LINK}/videos"
      end

      def params
        super.merge(
          video_params
        )
      end

      def video_params
        {
          id: @args[:video_id],
          part: 'snippet,statistics'
        }
      end

      def data
        { video: video_data }
      end

      def video_base_data
        {
          title:,
          youtube_id: video['id'],
          channel: channel_data
        }
      end
    end
  end
end
