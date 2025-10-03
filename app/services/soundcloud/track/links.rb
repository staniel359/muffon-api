module SoundCloud
  module Track
    class Links < SoundCloud::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
