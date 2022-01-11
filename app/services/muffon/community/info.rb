module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        Muffon::Communities::Community.call(
          community:
        )
      end
    end
  end
end
