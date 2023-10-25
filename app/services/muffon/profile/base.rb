module Muffon
  module Profile
    class Base < Muffon::Base
      PARAMS = %i[
        email
        password
        password_confirmation
        nickname
        image
        gender
        birthdate
        country
        city
        private
        status
      ].freeze

      private

      def primary_args
        [@args[:profile_id]]
      end

      def no_data?
        profile.blank?
      end

      def forbidden?
        return false if creator?

        profile.private && !valid_profile?
      end

      def profile_params
        PARAMS.reject do |p|
          %i[image].include?(p)
        end
      end

      def data
        { profile: profile_data }
      end

      def nickname
        profile.nickname
      end

      def check_password
        return if authenticated?

        add_wrong_password_error
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
    end
  end
end
