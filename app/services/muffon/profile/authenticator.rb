module Muffon
  module Profile
    class Authenticator < Muffon::Profile::Base
      PARAMS = %i[
        email
        password
      ].freeze

      private

      def primary_args
        [
          @args[:email],
          @args[:password]
        ]
      end

      def forbidden?
        false
      end

      def profile
        @profile ||=
          ::Profile.with_email(
            @args[:email]
          )
      end

      def data
        profile

        check_password

        return profile.errors_data if
            profile.errors?

        { profile: profile_data }
      end

      def profile_data
        profile.slice(
          *%i[id token]
        )
      end
    end
  end
end
