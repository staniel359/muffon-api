module Deezer
  module Utils
    module Token
      class User < Deezer::Base
        API_METHOD = 'deezer.getUserData'.freeze

        def call
          data
        end

        private

        def data
          {
            license_token: license_token,
            api_token: response_api_token
          }
        end

        def license_token
          response_data.dig(
            'results', 'USER',
            'OPTIONS', 'license_token'
          )
        end

        def api_token
          ''
        end

        def response_api_token
          response_data.dig(
            'results', 'checkForm'
          )
        end
      end
    end
  end
end
