module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      BASE_LINK = 'https://ok.ru/dk'.freeze

      def call
        response
      rescue RestClient::Found => e
        session_id(e)
      end

      private

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
          'User-Agent' => user_agent,
          params:
        }
      end

      def user_agent
        'Mozilla/5.0 (X11; Linux x86_64; rv:99.0)'\
          ' Gecko/20100101 Firefox/99.0'
      end

      def params
        { cmd: 'AnonymLogin' }
      end

      def session_id(redirect)
        return '' unless
            successful_login?(redirect)

        redirect.response.cookies[
          'JSESSIONID'
        ]
      end

      def successful_login?(redirect)
        redirect
          .response
          .headers[:location] == '/'
      end

      alias response post_response
    end
  end
end
