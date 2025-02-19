module Muffon
  module Community
    class Description < Muffon::Community::Base
      private

      def community_data
        {
          description:
            community.description
        }
      end
    end
  end
end
