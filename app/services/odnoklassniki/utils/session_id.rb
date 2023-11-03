module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      BASE_LINK = 'https://ok.ru/dk'.freeze

      def call
        post_response

        nil
      rescue RestClient::Found => e
        session_id(e)
      rescue RestClient::ServerBrokeConnection
        nil
      end

      private

      def post_response
        RestClient::Request.execute(
          method: :post,
          url: link,
          payload:,
          headers:,
          proxy:
        )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          'st.email' => email,
          'st.password' => password,
          'st.posted' => 'set',
          'st.lang' => 'en'
        }
      end

      def email
        secrets.odnoklassniki[:email]
      end

      def password
        secrets.odnoklassniki[:password]
      end

      def headers
        {
          'User-Agent' => USER_AGENT,
          params:
        }
      end

      def params
        { cmd: 'AnonymLogin' }
      end

      def session_id(redirect)
        redirect
          .response
          .cookies[
            'JSESSIONID'
          ]
      end
    end
  end
end
