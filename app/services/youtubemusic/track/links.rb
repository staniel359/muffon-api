module YouTubeMusic
  module Track
    class Links < YouTubeMusic::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
