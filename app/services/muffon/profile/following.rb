module Muffon
  module Profile
    class Following < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'following'.freeze

      private

      def profiles_conditional
        if creator?
          following_profiles
        else
          following_profiles.public
        end
      end

      def following_profiles
        profile.following_profiles
      end
    end
  end
end
