module YandexMusic
  module Utils
    class SessionId
      class Password < YandexMusic::Utils::SessionId
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [
            @args[:csrf_token],
            @args[:unique_uid],
            @args[:track_id]
          ]
        end

        def data
          { session_id: }
        end

        def session_id
          get_cookie(
            response:,
            cookie: 'Session_id'
          )
        end

        def response
          format_post_request(
            link:,
            payload:,
            headers:,
            cookies:,
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
          }
        end

        def password
          secrets.yandex_music[:password]
        end

        def track_id
          @args[:track_id]
        end

        def csrf_token
          @args[:csrf_token]
        end

        def cookies
          { uniqueuid: unique_uid }
        end

        def unique_uid
          @args[:unique_uid]
        end
      end
    end
  end
end
