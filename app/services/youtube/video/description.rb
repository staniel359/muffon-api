module YouTube
  module Video
    class Description < YouTube::Video::Base
      private

      def video_data
        { description: description }
      end
    end
  end
end
