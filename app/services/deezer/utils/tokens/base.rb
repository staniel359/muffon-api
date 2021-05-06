module Deezer
  module Utils
    module Tokens
      class Base < Deezer::Utils::Base
        def call
          data
        end

        private

        def response_data
          @response_data ||= JSON.parse(response)
        end

        def response
          RestClient.post(link, payload, headers)
        end

        def link
          'https://www.deezer.com/ajax/gw-light.php'
        end

        def headers
          { params: params, cookies: cookies }
        end

        def params
          {
            method: request_method,
            input: 3,
            api_version: 1.0,
            api_token: request_api_token
          }
        end

        def cookies
          { sid: secrets.deezer[:session_id] }
        end
      end
    end
  end
end
