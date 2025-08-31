module Muffon
  module Profile
    class Authenticator < Muffon::Profile::Base
      PARAMS = %i[
        email
        password
      ].freeze

      private

      def required_args
        %i[
          email
          password
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

        if profile.errors?
          profile.errors_data
        else
          { profile: profile_data }
        end
      end

      def profile_data
        profile.slice(
          *%i[id token]
        )
      end
    end
  end
end
