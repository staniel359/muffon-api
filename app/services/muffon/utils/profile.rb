module Muffon
  module Utils
    module Profile
      private

      def wrong_profile?
        profile.blank? || (
          profile.token != @args[:token]
        )
      end

      def profile
        return if @args[:profile_id].blank?

        @profile ||=
          ::Profile.find_by(
            id: @args[:profile_id]
          )
      end

      def wrong_other_profile?
        other_profile.blank? || (
          other_profile.token != @args[:token]
        )
      end

      def other_profile
        return if @args[:other_profile_id].blank?

        @other_profile ||=
          ::Profile.find_by(
            id: @args[:other_profile_id]
          )
      end
    end
  end
end
