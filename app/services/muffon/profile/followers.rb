module Muffon
  module Profile
    class Followers < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'followers'.freeze

      private

      def profiles
        @profiles ||=
          profile.follower_profiles
      end
    end
  end
end