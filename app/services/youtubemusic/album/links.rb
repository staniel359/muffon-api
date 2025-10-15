module YouTubeMusic
  module Album
    class Links < YouTubeMusic::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
