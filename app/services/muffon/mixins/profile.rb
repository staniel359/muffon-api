module Muffon
  module Mixins
    module Profile
      private

      def creator?
        profile_valid_creator? ||
          other_profile_valid_creator?
      end

      def profile_valid_creator?
        valid_profile? &&
          profile_record.creator?
      end

      def valid_profile?
        profile_record.present? &&
          valid_profile_token?
      end

      def profile_record
        return if @args[:profile_id].blank?

        if defined?(@profile_record)
          @profile_record
        else
          @profile_record =
            ::Profile.find_by(
              id: @args[:profile_id]
            )
        end
      end

      def valid_profile_token?
        profile_record.token == @args[:token]
      end

      def other_profile_valid_creator?
        valid_other_profile? &&
          other_profile_record.creator?
      end

      def valid_other_profile?
        other_profile_record.present? &&
          valid_other_profile_token?
      end

      def other_profile_record
        return if @args[:other_profile_id].blank?

        if defined?(@other_profile_record)
          @other_profile_record
        else
          @other_profile_record =
            ::Profile.find_by(
              id: @args[:other_profile_id]
            )
        end
      end

      def valid_other_profile_token?
        other_profile_record.token == @args[:token]
      end
    end
  end
end
