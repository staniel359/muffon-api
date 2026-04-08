module Spotify
  module Utils
    module User
      class AccessToken < Spotify::Base
        BASE_LINK =
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

        def link
          BASE_LINK
        end

        def payload
          {
            grant_type: 'authorization_code',
            code: @args[:code],
            redirect_uri:
          }
        end

        def redirect_uri
          "#{credentials[:url]}/code"
        end

        def headers
          {
            'Authorization' => "Basic #{client_id_secret_encoded}",
            'Content-Type' => 'application/x-www-form-urlencoded'
          }
        end

        def client_id_secret_encoded
          Base64.strict_encode64(
            raw_client_id_secret
          )
        end

        def raw_client_id_secret
          "#{@args[:client_id]}:#{@args[:client_secret]}"
        end

        def refresh_token
          response_data['refresh_token']
        end

        alias response post_response
      end
    end
  end
end
