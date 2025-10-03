module VK
  module Track
    class Links < VK::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
