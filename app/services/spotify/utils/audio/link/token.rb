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
              params:,
              cookies:,
              proxy:
            )
          end

          def link
            BASE_LINK
          end

          def params
            {
              reason: 'init',
              productType: 'web-player',
              totp:,
              totpVer: 5,
              ts: current_time_milliseconds
            }
          end

          def totp
            return '705153' if test?

            totp_data.now
          end

          def totp_data
            ROTP::TOTP.new(
              totp_secret
            )
          end

          def totp_secret
            secrets.spotify[:totp_secret]
          end

          def current_time_milliseconds
            return '1742116599000' if test?

            Time.current.to_i * 1000
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
