module YouTube
  module Video
    class ViewsCount < YouTube::Video::Info
      private

      def video_data
        update_video_record!

        { views_count: }
      end
    end
  end
end
