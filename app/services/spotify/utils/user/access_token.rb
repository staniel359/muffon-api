module Spotify
  module Utils
    module User
      class AccessToken < Spotify::Utils::Token
        private

        def primary_args
          [@args[:code]]
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
          "#{secrets.url}/code"
        end

        def refresh_token
          response_data['refresh_token']
        end
      end
    end
  end
end
