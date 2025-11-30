module Spotify
  module Utils
    module Audio
      class Link
        class ClientToken < Spotify::Base
          BASE_LINK =
            'https://clienttoken.spotify.com/v1/clienttoken'.freeze

          def call
            data
          end

          private

          def data
            response_data.dig(
              'granted_token',
              'token'
            )
          end

          def link
            BASE_LINK
          end

          def payload
            {
              client_data: {
                client_version: '1.2.81.4.g79efc0bd',
                client_id: 'd8a5ed958d274c2e8ee717e6a4b0971d',
                js_sdk_data: {
                  os: 'linux',
                  device_id: '7b473c09-69cf-4425-8495-4b7b5bb7e053',
                  device_type: 'computer'
                }
              }
            }.to_json
          end

          def headers
            {
              'Content-Type' => 'application/json',
              'Accept' => 'application/json'
            }
          end

          alias response post_response
        end
      end
    end
  end
end
