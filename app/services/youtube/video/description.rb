module YouTube
  module Video
    class Description < YouTube::Video::Info
      private

      def video_data
        { description: description }
      end
    end
  end
end
