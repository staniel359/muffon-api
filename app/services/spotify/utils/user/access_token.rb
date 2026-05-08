module Spotify
  module Utils
    module User
      class AccessToken < Spotify::Base
        REQUEST_BASE_URL =
          'https://accounts.spotify.com/api/token'.freeze

        def call
          check_args

          data
        rescue Faraday::BadRequestError
          raise bad_request_error
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

        def request_url
          REQUEST_BASE_URL
        end

        def request_payload
          {
            grant_type: 'authorization_code',
            code: @args[:code],
            redirect_uri:
          }
        end

        def redirect_uri
          "#{credentials[:url]}/code"
        end

        def request_headers
          {
            'Authorization' =>
              "Basic #{client_id_secret_encoded}",
            'Content-Type' =>
              'application/x-www-form-urlencoded'
          }
        end

        def client_id_secret_encoded
          Base64.strict_encode64(
            raw_client_id_secret
          )
        end

        def raw_client_id_secret
          "#{client_id}:#{client_secret}"
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
