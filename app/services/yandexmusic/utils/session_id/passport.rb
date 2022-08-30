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
          response_data.css(
            'input[name="csrf_token"]'
          )[0]['value']
        end

        def response_data
          Nokogiri::HTML.parse(
            response
          )
        end

        def response
          @response ||=
            RestClient::Request.execute(
              method: :get,
              url: BASE_LINK,
              proxy:
            )
        end

        def unique_uid
          response.cookies['uniqueuid']
        end
      end
    end
  end
end
