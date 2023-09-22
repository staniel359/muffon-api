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
          response.cookies[
            'Session_id'
          ]
        end

        def response
          RestClient::Request.execute(
            method: :post,
            url: link,
            payload:,
            headers:,
            proxy:
          )
        end

        def link
          "#{login_base_link}/commit_password"
        end

        def payload
          {
            password:,
            track_id:,
            csrf_token:
              @args[:csrf_token]
          }
        end

        def password
          secrets.yandex_music[:password]
        end

        def track_id
          email_data[:track_id]
        end

        def email_data
          YandexMusic::Utils::SessionId::Email.call(
            csrf_token:
              @args[:csrf_token],
            unique_uid:
              @args[:unique_uid]
          )
        end

        def cookies
          { uniqueuid: @args[:unique_uid] }
        end
      end
    end
  end
end
