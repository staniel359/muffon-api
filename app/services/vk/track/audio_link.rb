module VK
  module Track
    class AudioLink < VK::Track::Base
      private

      def data
        track['url']
      end

      def user_agent
        secrets.vk[:user_agent_kate]
      end

      def access_token
        secrets.vk[:access_token_kate]
      end

      def api_secret
        secrets.vk[:api_secret_kate]
      end
    end
  end
end
