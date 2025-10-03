module YouTube
  module Video
    class Links < YouTube::Video::Info
      private

      def video_data
        { links: source_links_data }
      end
    end
  end
end
