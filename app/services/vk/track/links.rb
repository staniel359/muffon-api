module VK
  module Track
    class Links < VK::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
