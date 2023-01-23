module Muffon
  module Profile
    class Authenticator < Muffon::Base
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

      def no_data?
        profile.blank?
      end

      def profile
        @profile ||=
          ::Profile.find_by(
            email: @args[:email]
          )
      end

      def data
        add_wrong_password_error unless
            authenticated?

        return profile.errors_data if
            profile.errors?

        { profile: profile_data }
      end

      def authenticated?
        !!profile.authenticate(
          @args[:password]
        )
      end

      def add_wrong_password_error
        profile
          .errors
          .add(
            :password, 'wrong'
          )
      end

      def profile_data
        profile.slice(
          *%i[id token]
        )
      end
    end
  end
end
