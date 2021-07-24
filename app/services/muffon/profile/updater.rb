module Muffon
  module Profile
    class Updater < Muffon::Profile::Base
      private

      def primary_args
        [
          @args.profile_id,
          @args.token
        ]
      end

      def data
        process_profile

        { profile: profile_data }
      end

      def process_profile
        return forbidden if wrong_profile?

        profile.update!(update_params)

        return errors_data if errors?

        process_avatar
      end

      def wrong_profile?
        profile.token != @args.token
      end

      def update_params
        @args.to_h.slice(
          *profile_params
        )
      end
    end
  end
end
