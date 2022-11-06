module Muffon
  module Utils
    module Profile
      private

      def wrong_profile?
        profile.token != @args[:token]
      end

      def profile
        @profile ||=
          ::Profile.find_by(
            id: @args[:profile_id]
          )
      end

      def other_profile
        @other_profile ||=
          ::Profile.find_by(
            id: @args[:other_profile_id]
          )
      end
    end
  end
end
