module YandexMusic
  module Utils
    class SessionId
      class Password < YandexMusic::Utils::SessionId
        def call
          data
        end

        private

        def data
          { session_id: }
        end

        def session_id
          post_response.cookies[
            'Session_id'
          ]
        end

        def link
          "#{login_base_link}/commit_password"
        end

        def payload
          {
            password:,
            track_id:,
            csrf_token:
          }
        end

        def password
          secrets.yandex_music[:password]
        end

        def track_id
          email_data[:track_id]
        end
      end
    end
  end
end
