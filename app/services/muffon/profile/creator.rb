module Muffon
  module Profile
    class Creator < Muffon::Profile::Base
      private

      def primary_args
        [
          @args[:email],
          @args[:password],
          @args[:password_confirmation],
          @args[:nickname]
        ]
      end

      def profile
        @profile ||= ::Profile.create(
          create_params
        )
      end

      def create_params
        @args.permit!.slice(
          *profile_params
        )
      end

      def data
        return errors_data if errors?

        process_image

        authenticate

        set_online
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

      def set_online
        ::Muffon::Profile::Online.call(
          profile_id: profile_id,
          token: profile_token,
          online: true
        )
      end

      def profile_id
        profile.id
      end

      def profile_token
        profile.token
      end
    end
  end
end
