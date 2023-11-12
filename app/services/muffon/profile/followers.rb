module Muffon
  module Profile
    class Followers < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'followers'.freeze

      private

      def profiles_conditional
        if creator?
          follower_profiles
        else
          follower_profiles.public
        end
      end

      def follower_profiles
        profile.follower_profiles
      end
    end
  end
end
