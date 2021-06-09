module YouTube
  module Video
    class Base < YouTube::Base
      private

      def primary_args
        [@args.video_id]
      end

      def no_data?
        video.blank?
      end

      def video
        @video ||= response_data.dig(
          'items', 0
        )
      end

      def link
        "#{BASE_LINK}/videos"
      end

      def params
        super.merge(video_params)
      end

      def video_params
        {
          id: @args.video_id,
          part: 'id,snippet,statistics'
        }
      end

      def data
        { video: video_data }
      end

      def description
        snippet['description']
      end

      def snippet
        @snippet ||= video['snippet']
      end

      def tags_list
        snippet['tags']
      end
    end
  end
end
