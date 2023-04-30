module YouTube
  module Video
    class Links < YouTube::Video::Info
      private

      def video_data
        { links: source_links }
      end
    end
  end
end
