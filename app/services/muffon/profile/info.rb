module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        Muffon::Profiles::Profile.call(
          profile:,
          token: @args[:token],
          other_profile_id:
            @args[:other_profile_id]
        )
      end

      def profile
        @profile ||=
          ::Profile
          .associated
          .find_by(
            id: @args[:profile_id]
          )
      end
    end
  end
end
