module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        Muffon::Formatter::Profile::Info.call(
          profile_record:,
          token: @args[:token],
          other_profile_id: @args[:other_profile_id]
        )
      end
    end
  end
end
