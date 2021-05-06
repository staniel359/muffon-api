module Deezer
  module Utils
    module Tokens
      class User < Base
        private

        def data
          {
            license_token: license_token,
            api_token: api_token
          }
        end

        def license_token
          response_data.dig(
            'results', 'USER', 'OPTIONS', 'license_token'
          )
        end

        def payload
          {}
        end

        def request_method
          'deezer.getUserData'
        end

        def request_api_token
          ''
        end

        def api_token
          response_data.dig('results', 'checkForm')
        end
      end
    end
  end
end
