module Muffon
  module Profile
    class Followers < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'followers'.freeze

      private

      def profiles_conditional
        if creator?
          profile.follower_profiles
        else
          profile
            .follower_profiles
            .public
        end
      end
    end
  end
end
