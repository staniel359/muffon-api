module Spotify
  module Utils
    module Audio
      class Link
        class Token < Spotify::Base
          BASE_LINK =
            'https://open.spotify.com/api/token'.freeze

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
              headers:
            )
          end

          def link
            BASE_LINK
          end

          def params
            {
              reason: 'init',
              productType: 'web-player',
              totp: password,
              totpServer: password,
              totpVer: 10
            }
          end

          def password
            @password ||=
              if test?
                '842947'
              else
                password_data.now
              end
          end

          def password_data
            ROTP::TOTP.new(
              password_secret
            )
          end

          def password_secret
            secrets.spotify[:totp_secret]
          end

          def headers
            {
              'User-Agent' => USER_AGENT,
              'Cookie' => "sp_dc=#{sp_dc_cookie}"
            }
          end

          def sp_dc_cookie
            secrets
              .spotify
              .dig(
                :cookies,
                :sp_dc
              )
          end
        end
      end
    end
  end
end
