module AmazonMusic
  module Utils
    module Request
      class Payload < AmazonMusic::Base
        def call
          data
        end

        private

        def data
          {
            'id' => model_id,
            'keyword' => query,
            'next' => page,
            'headers' => headers.to_json
          }.compact.to_json
        end

        def model_id
          @args[:model_id]
        end

        def query
          @args[:query]
        end

        def page
          @args[:page]
        end

        def headers
          {
            'x-amzn-authentication' =>
              authentication_headers.to_json,
            'x-amzn-device-model' => 'WEBPLAYER',
            'x-amzn-device-width' => '1920',
            'x-amzn-device-family' => 'WebPlayer',
            'x-amzn-device-id' => DEVICE_ID,
            'x-amzn-user-agent' => USER_AGENT,
            'x-amzn-device-height' => '1080',
            'x-amzn-request-id' => request_id,
            'x-amzn-device-language' => 'en_GB',
            'x-amzn-os-version' => '1.0',
            'x-amzn-application-version' => '1.0.15759.0',
            'x-amzn-timestamp' => current_time_formatted,
            'x-amzn-page-url' => 'https://music.amazon.com',
            'x-amzn-video-player-token' => {}.to_json
          }
        end

        def authentication_headers
          {
            'interface' =>
              'ClientAuthenticationInterface.v1_0.ClientTokenElement',
            'accessToken' => amazonmusic_token
          }
        end

        def request_id
          SecureRandom.uuid
        end

        def current_time_formatted
          (Time.current.to_i * 1000).to_s
        end
      end
    end
  end
end
