module AmazonMusic
  module Utils
    class Token < AmazonMusic::Base
      BASE_LINK =
        'https://api.amazon.com/auth/o2/token'.freeze

      private

      def data
        response_data['access_token']
      end

      def link
        BASE_LINK
      end

      def params
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

      def payload
        nil
      end

      alias response post_response
    end
  end
end
