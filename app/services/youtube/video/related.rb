module YouTube
  module Video
    class Related < YouTube::Video::Base
      private

      def search_data
        @search_data ||=
          YouTube::Search::Videos.call(
            search_args
          )[:search] || {}
      end

      def search_args
        @args.slice(
          *%i[video_id limit page]
        )
      end

      def video_data
        video_base_data
          .merge(video_related_data)
      end

      def video_related_data
        {
          prev_page:,
          next_page:,
          related:
        }.compact
      end

      def prev_page
        search_data[:prev_page]
      end

      def next_page
        search_data[:next_page]
      end

      def related
        search_data[:videos] || []
      end
    end
  end
end
