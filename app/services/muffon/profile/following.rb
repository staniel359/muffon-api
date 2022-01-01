module Muffon
  module Profile
    class Following < Muffon::Profile::Relationships::Base
      COLLECTION_NAME = 'following'.freeze

      private

      def profiles
        @profiles ||=
          profile.following_profiles
      end
    end
  end
end