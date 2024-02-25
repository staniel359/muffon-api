module Spotify
  module Utils
    module Audio
      class Decrypter
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
              proxy:
            )
          end

          def link
            BASE_LINK
          end
        end
      end
    end
  end
end
