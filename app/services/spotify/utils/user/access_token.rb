module Spotify
  module Utils
    module User
      class AccessToken < Spotify::Utils::Token
        def call
          check_args

          data
        rescue Faraday::BadRequestError
          raise not_found_error
        end

        private

        def required_args
          %i[
            code
            client_id
            client_secret
          ]
        end

        def data
          {
            access_token:,
            refresh_token:
          }
        end

        def access_token
          response_data['access_token']
        end

        def payload
          {
            grant_type:
              'authorization_code',
            code: @args[:code],
            redirect_uri:
          }
        end

        def redirect_uri
          "#{credentials[:url]}/code"
        end

        def client_id
          @args[:client_id]
        end

        def client_secret
          @args[:client_secret]
        end

        def refresh_token
          response_data['refresh_token']
        end
      end
    end
  end
end
