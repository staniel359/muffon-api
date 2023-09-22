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
          "#{login_base_link}/start"
        end

        def payload
          {
            login: email,
            csrf_token: @args[:csrf_token]
          }
        end

        def email
          secrets.yandex_music[:email]
        end

        def cookies
          { uniqueuid: @args[:unique_uid] }
        end
      end
    end
  end
end
