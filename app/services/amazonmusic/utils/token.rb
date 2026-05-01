module AmazonMusic
  module Utils
    class Token < AmazonMusic::Base
      REQUEST_BASE_URL = 'https://api.amazon.com/auth/o2/token'.freeze

      def call
        data
      end

      private

      def data
        response_data['access_token']
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_payload
        {
          grant_type: 'refresh_token',
          client_id:,
          client_secret:,
          refresh_token:
        }
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
