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

      def link
        BASE_LINK
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

      alias response post_response
    end
  end
end
