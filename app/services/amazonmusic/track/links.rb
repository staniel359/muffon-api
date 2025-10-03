module AmazonMusic
  module Track
    class Links < AmazonMusic::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
