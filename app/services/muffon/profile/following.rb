module Muffon
  module Profile
    class Following < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'following'.freeze

      private

      def profiles_conditional
        if creator?
          profile.following_profiles
        else
          profile
            .following_profiles
            .public
        end
      end
    end
  end
end
