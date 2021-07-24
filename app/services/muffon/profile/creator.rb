module Muffon
  module Profile
    class Creator < Muffon::Profile::Base
      private

      def primary_args
        [
          @args.email,
          @args.password,
          @args.password_confirmation,
          @args.nickname
        ]
      end

      def no_data?
        false
      end

      def profile
        @profile ||= ::Profile.create(
          create_params
        )
      end

      def create_params
        @args.to_h.slice(
          *profile_params
        )
      end

      def data
        return errors_data if errors?

        process_avatar

        authenticate
      end

      def authenticate
        Muffon::Profile::Authenticator.call(
          authenticate_params
        )
      end

      def authenticate_params
        profile.slice(
          *Muffon::Profile::Authenticator::PARAMS
        )
      end
    end
  end
end
