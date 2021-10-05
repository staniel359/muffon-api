module SoundCloud
  module Utils
    class AccessToken < SoundCloud::Base
      BASE_LINK = 'https://api.soundcloud.com/oauth2/token'.freeze

      def call
        data
      rescue RestClient::TooManyRequests
        nil
      end

      private

      def data
        response_data['access_token']
      end

      def response
        RestClient.post(
          BASE_LINK, payload
        )
      end

      def payload
        {
          client_id: client_id,
          client_secret: client_secret,
          grant_type: 'client_credentials'
        }
      end

      def client_id
        secrets.soundcloud[:client_id]
      end

      def client_secret
        secrets.soundcloud[:client_secret]
      end
    end
  end
end
