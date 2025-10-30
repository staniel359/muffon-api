module Spotify
  module Utils
    module Audio
      class Link
        class Token < Spotify::Base
          BASE_LINK =
            'http://localhost:3745/access_token'.freeze

          def call
            data
          rescue Faraday::ConnectionFailed
            nil
          end

          private

          def data
            return test_token if test?

            response_data['token']
          end

          def test_token
            credentials.dig(
              :spotify,
              :test_audio_token
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
