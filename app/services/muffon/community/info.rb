module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        Muffon::Formatter::Community::Info.call(
          community_record:,
          **self_args
        )
      end

      def community_record
        if defined?(@community_record)
          @community_record
        else
          @community_record =
            ::Community
            .associated
            .find_by(
              id: @args[:community_id]
            )
        end
      end
    end
  end
end
