module Spotify
  module Utils
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
          'client_data' => {
            'client_id' => 'd8a5ed958d274c2e8ee717e6a4b0971d',
            'client_version' => '1.2.88.21.g8e037c8f',
            'js_sdk_data' => {
              'device_brand' => 'unknown',
              'device_id' => '7b473c09-69cf-4425-8495-4b7b5bb7e053',
              'device_model' => 'unknown',
              'device_type' => 'computer',
              'os' => 'linux',
              'os_version' => 'unknown'
            }
          }
        }.to_json
      end

      def headers
        {
          'User-Agent' => USER_AGENT,
          'Accept' => 'application/json'
        }
      end

      alias response post_response
    end
  end
end
