module YandexMusic
  module Utils
    class SessionId
      class Email < YandexMusic::Utils::SessionId
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [
            @args[:csrf_token],
            @args[:unique_uid]
          ]
        end

        def data
          { track_id: }
        end

        def track_id
          response_data['track_id']
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
          "#{login_base_link}/start"
        end

        def payload
          {
            login: email,
            csrf_token:
          }
        end

        def csrf_token
          @args[:csrf_token]
        end

        def email
          secrets.yandex_music[:email]
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
