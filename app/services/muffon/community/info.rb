module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        Muffon::Communities::Community.call(
          community:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
