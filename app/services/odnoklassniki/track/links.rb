module Odnoklassniki
  module Track
    class Links < Odnoklassniki::Track::Info
      private

      def track_data
        { links: source_links_data }
      end
    end
  end
end
