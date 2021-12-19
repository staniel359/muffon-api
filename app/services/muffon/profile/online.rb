module Muffon
  module Profile
    class Online < Muffon::Profile::Base
      private

      def primary_args
        [
          @args[:profile_id],
          @args[:token],
          @args[:online]
        ]
      end

      def no_data?
        profile.blank?
      end

      def profile_data
        return forbidden if wrong_profile?

        profile.update(
          online: @args[:online]
        )

        { success: true }
      end
    end
  end
end
