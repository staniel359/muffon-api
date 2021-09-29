module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        Muffon::Profiles::Profile.call(
          profile: profile,
          token: @args.token
        )
      end
    end
  end
end
