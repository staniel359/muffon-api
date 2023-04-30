module Odnoklassniki
  module Track
    class Links < Odnoklassniki::Track::Info
      private

      def track_data
        { links: source_links }
      end
    end
  end
end
