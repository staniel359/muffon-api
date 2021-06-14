module YouTube
  module Search
    class Videos < YouTube::Search::Base
      private

      def no_data?
        videos_list.blank?
      end

      def search_data
        {
          prev_page: prev_page,
          next_page: next_page,
          videos: videos
        }
      end

      def video_data_formatted(video)
        YouTube::Search::Videos::Video.call(
          video: video
        )
      end
    end
  end
end
