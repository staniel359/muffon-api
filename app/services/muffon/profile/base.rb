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

      include Muffon::Mixins::Profile

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
        profile_record.blank?
      end

      def forbidden?
        if profile_record.private
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

      def profile_data
        { nickname: }
      end

      def nickname
        profile_record.nickname
      end

      def check_password
        return if authenticated?

        add_wrong_password_error
      end

      def authenticated?
        !!profile_record.authenticate(
          @args[:password]
        )
      end

      def add_wrong_password_error
        profile_record
          .errors
          .add(
            :password,
            'wrong'
          )
      end
    end
  end
end
