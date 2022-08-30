module YandexMusic
  module Utils
    class SessionId
      class Email < YandexMusic::Utils::SessionId
        def call
          data
        end

        private

        def data
          { track_id: }
        end

        def track_id
          response_data['track_id']
        end

        def link
          "#{login_base_link}/start"
        end

        def payload
          {
            login: email,
            csrf_token:
          }
        end

        def email
          secrets.yandex_music[:email]
        end

        alias response post_response
      end
    end
  end
end
