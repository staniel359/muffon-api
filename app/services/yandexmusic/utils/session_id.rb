module YandexMusic
  module Utils
    class SessionId < YandexMusic::Base
      BASE_LINK =
        'https://passport.yandex.ru'.freeze

      def call
        return if no_data?

        data
      end

      private

      def no_data?
        csrf_token.blank? ||
          unique_uid.blank? ||
          track_id.blank?
      end

      def csrf_token
        passport_data[:csrf_token]
      end

      def passport_data
        @passport_data ||=
          YandexMusic::Utils::SessionId::Passport.call
      end

      def unique_uid
        passport_data[:unique_uid]
      end

      def track_id
        email_data.try(
          :[], :track_id
        )
      end

      def email_data
        @email_data ||=
          YandexMusic::Utils::SessionId::Email.call(
            csrf_token:,
            unique_uid:
          )
      end

      def login_base_link
        "#{BASE_LINK}/registration-validations/auth/multi_step"
      end

      def data
        password_data.try(
          :[], :session_id
        )
      end

      def password_data
        YandexMusic::Utils::SessionId::Password.call(
          csrf_token:,
          unique_uid:,
          track_id:
        )
      end
    end
  end
end
