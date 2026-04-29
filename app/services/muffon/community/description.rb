module Muffon
  module Community
    class Description < Muffon::Community::Base
      private

      def community_data
        Muffon::Formatter::Community::Description.call(
          community_record:
        )
      end
    end
  end
end
