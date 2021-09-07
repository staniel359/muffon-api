module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def data
        { profile: profile_data }
      end

      def profile_data
        Muffon::Profiles::Profile.call(
          profile: profile,
          token: @args.token
        )
      end
    end
  end
end
