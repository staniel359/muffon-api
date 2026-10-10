module AmazonMusic
  module Utils
    class Token < AmazonMusic::Base
      REQUEST_URL = 'https://api.amazon.com/auth/o2/token'.freeze

      def call
        data
      end

      private

      def data
        response_data['access_token']
      end

      def request_payload
        {
          grant_type: 'refresh_token',
          client_id:,
          client_secret:,
          refresh_token:
        }.to_json
      end

      def client_id
        credentials.dig(
          :amazon_music,
          :client_id
        )
      end

      def client_secret
        credentials.dig(
          :amazon_music,
          :client_secret
        )
      end

      def refresh_token
        credentials.dig(
          :amazon_music,
          :refresh_token
        )
      end
    end
  end
end
