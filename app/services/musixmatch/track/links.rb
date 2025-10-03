module MusixMatch
  module Track
    class Links < MusixMatch::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
