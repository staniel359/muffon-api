module YandexMusic
  module Utils
    class SessionId < YandexMusic::Base
      def call
        data
      end

      private

      def data
        password_response.cookies['Session_id']
      end

      def password_response
        RestClient.post(password_link, password_payload, headers)
      end

      def password_link
        'https://passport.yandex.ru/registration-validations'\
          '/auth/multi_step/commit_password'
      end

      def password_payload
        {
          track_id: track_id,
          csrf_token: secrets.yandex[:csrf_token],
          password: secrets.yandex[:password]
        }
      end

      def track_id
        JSON.parse(email_response)['track_id']
      end

      def email_response
        RestClient.post(email_link, email_payload, headers)
      end

      def email_link
        'https://passport.yandex.ru/registration-validations'\
          '/auth/multi_step/start'
      end

      def email_payload
        {
          csrf_token: secrets.yandex[:csrf_token],
          login: secrets.yandex[:email]
        }
      end

      def headers
        {
          cookies: {
            uniqueuid: secrets.yandex[:unique_uid].to_s
          }
        }
      end
    end
  end
end
