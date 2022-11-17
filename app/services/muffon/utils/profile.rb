module Muffon
  module Utils
    module Profile
      private

      def creator?
        profile_valid_creator? ||
          other_profile_valid_creator?
      end

      def profile_valid_creator?
        valid_profile? &&
          profile.creator?
      end

      def valid_profile?
        profile.present? &&
          valid_profile_token?
      end

      def profile
        return if @args[:profile_id].blank?

        @profile ||=
          ::Profile.find_by(
            id: @args[:profile_id]
          )
      end

      def valid_profile_token?
        profile.token == @args[:token]
      end

      def other_profile_valid_creator?
        valid_other_profile? &&
          other_profile.creator?
      end

      def valid_other_profile?
        other_profile.present? &&
          valid_other_profile_token?
      end

      def other_profile
        return if @args[:other_profile_id].blank?

        @other_profile ||=
          ::Profile.find_by(
            id: @args[:other_profile_id]
          )
      end

      def valid_other_profile_token?
        other_profile.token == @args[:token]
      end
    end
  end
end
