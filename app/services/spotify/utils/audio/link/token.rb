module Spotify
  module Utils
    module Audio
      class Link
        class Token < Spotify::Base
          BASE_LINK =
            'https://open.spotify.com/get_access_token'.freeze

          def call
            data
          end

          private

          def data
            response_data['accessToken']
          end

          def response
            format_get_request(
              link:,
              cookies:,
              proxy:
            )
          end

          def link
            BASE_LINK
          end

          def cookies
            { sp_dc: sp_dc_cookie }
          end

          def sp_dc_cookie
            secrets.spotify.dig(
              :cookies, :sp_dc
            )
          end
        end
      end
    end
  end
end
