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
          @args.email,
          @args.password
        ]
      end

      def no_data?
        profile.blank?
      end

      def profile
        @profile ||= ::Profile.find_by(
          email: @args.email
        )
      end

      def data
        return not_found unless authenticated?

        { profile: profile_data }
      end

      def authenticated?
        !!profile.authenticate(
          @args.password
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
