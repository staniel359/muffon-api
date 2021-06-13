module YouTube
  module Video
    class Tags < YouTube::Video::Info
      private

      def video_data
        { tags: tags }
      end
    end
  end
end
