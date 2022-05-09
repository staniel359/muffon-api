module YouTube
  module Video
    class Related < YouTube::Video::Base
      private

      def search_data
        @search_data ||=
          YouTube::Search::Videos.call(
            video_id: @args[:video_id],
            limit: @args[:limit],
            page: @args[:page]
          )[:search] || {}
      end

      def video_data
        video_base_data
          .merge(video_related_data)
      end

      def video_related_data
        {
          prev_page:
            search_data[:prev_page],
          next_page:
            search_data[:next_page],
          related:
        }.compact
      end

      def related
        search_data[:videos] || []
      end
    end
  end
end
