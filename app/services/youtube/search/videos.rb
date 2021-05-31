module YouTube
  module Search
    class Videos < YouTube::Base
      private

      def no_data?
        videos_list.blank?
      end

      def videos_list
        @videos_list ||= response_data['items']
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          query: @args.query,
          next_page: next_page,
          videos: videos_data
        }
      end

      def next_page
        response_data['nextPageToken']
      end

      def videos_data
        videos_list.map do |v|
          video_data_formatted(v)
        end
      end

      def video_data_formatted(video)
        YouTube::Search::Videos::Video.call(
          video: video
        )
      end
    end
  end
end
