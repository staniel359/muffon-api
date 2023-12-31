module YandexMusic
  module Utils
    class SessionId
      class Passport < YandexMusic::Utils::SessionId
        def call
          data
        end

        private

        def data
          {
            csrf_token:,
            unique_uid:
          }
        end

        def csrf_token
          html_response_data.css(
            'input[name="csrf_token"]'
          )[0].try(
            :[], 'value'
          )
        end

        def response
          @response ||=
            format_get_request(
              link: BASE_LINK,
              proxy:
            )
        end

        def unique_uid
          get_cookie(
            response:,
            cookie: 'uniqueuid'
          )
        end
      end
    end
  end
end
