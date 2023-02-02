module YandexMusic
  module Utils
    class SessionId < YandexMusic::Base
      BASE_LINK =
        'https://passport.yandex.ru'.freeze

      def call
        data
      end

      private

      def data
        password_data[:session_id]
      end

      def password_data
        YandexMusic::Utils::SessionId::Password.call
      end

      def email_data
        YandexMusic::Utils::SessionId::Email.call
      end

      def post_response
        RestClient::Request.execute(
          method: :post,
          url: link,
          payload:,
          headers:,
          proxy:
        )
      end

      def login_base_link
        "#{BASE_LINK}/registration-validations/auth/multi_step"
      end

      def csrf_token
        passport_data[:csrf_token]
      end

      def passport_data
        @passport_data ||=
          YandexMusic::Utils::SessionId::Passport.call
      end

      def cookies
        { uniqueuid: unique_uid }
      end

      def unique_uid
        passport_data[:unique_uid]
      end
    end
  end
end
