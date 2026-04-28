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

      def profile_record
        @profile_record ||=
          ::Profile.with_email(
            @args[:email]
          )
      end

      def data
        profile_record

        check_password

        if profile_record.errors?
          profile_record.errors_data
        else
          { profile: profile_data }
        end
      end

      def profile_data
        profile_record.slice(
          :id,
          :token
        )
      end
    end
  end
end
