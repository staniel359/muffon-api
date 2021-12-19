module YouTube
  module Video
    class Base < YouTube::Base
      include YouTube::Utils::Video

      private

      def primary_args
        [@args[:video_id]]
      end

      def no_data?
        videos_list.blank?
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

      def video
        @video ||= videos_list[0]
      end
    end
  end
end
