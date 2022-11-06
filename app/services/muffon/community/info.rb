module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        Muffon::Communities::Community.call(
          community:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      def community
        @community ||=
          ::Community
          .associated
          .find_by(
            id: @args[:community_id]
          )
      end
    end
  end
end
