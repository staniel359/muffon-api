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
        save_activity_history
      ].freeze

      def call
        check_args

        check_if_not_found

        check_if_forbidden

        data
      end

      private

      def required_args
        %i[
          profile_id
        ]
      end

      def not_found?
        profile.blank?
      end

      def forbidden?
        if profile.private
          if creator?
            false
          else
            !valid_profile?
          end
        else
          false
        end
      end

      def profile_params
        PARAMS.reject do |param|
          param == :image
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
            :password,
            'wrong'
          )
      end
    end
  end
end
