module YandexMusic
  module Utils
    class SessionId < YandexMusic::Base
      def call
        data
      end

      private

      def data
        password_response.cookies[
          'Session_id'
        ]
      end

      def password_response
        RestClient::Request.execute(
          method: :post,
          url: password_link,
          payload: password_payload,
          headers:,
          proxy:
        )
      end

      def password_link
        'https://passport.yandex.ru' \
          '/registration-validations' \
          '/auth/multi_step/commit_password'
      end

      def password_payload
        {
          track_id:,
          csrf_token:,
          password:
        }
      end

      def track_id
        JSON.parse(
          email_response
        )['track_id']
      end

      def email_response
        RestClient::Request.execute(
          method: :post,
          url: email_link,
          payload: email_payload,
          headers:,
          proxy:
        )
      end

      def email_link
        'https://passport.yandex.ru' \
          '/registration-validations' \
          '/auth/multi_step/start'
      end

      def email_payload
        {
          csrf_token:,
          login: email
        }
      end

      def csrf_token
        secrets.yandex_music[:csrf_token]
      end

      def email
        secrets.yandex_music[:email]
      end

      def cookies
        {
          uniqueuid: unique_uid,
          i: i_cookie
        }
      end

      def unique_uid
        secrets.yandex_music[:unique_uid]
      end

      def i_cookie
        secrets.yandex_music[:i]
      end

      def password
        secrets.yandex_music[:password]
      end
    end
  end
end
