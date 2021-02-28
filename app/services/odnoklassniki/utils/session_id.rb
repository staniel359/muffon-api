module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      def call
        response
      rescue RestClient::Found => e
        session_id(e)
      end

      private

      def response
        RestClient.post(link, payload, headers)
      end

      def link
        'https://ok.ru/dk'
      end

      def payload
        {
          'st.email' => secrets.odnoklassniki[:email],
          'st.password' => secrets.odnoklassniki[:password],
          'st.posted' => 'set',
          'st.lang' => 'en'
        }
      end

      def headers
        { params: { cmd: 'AnonymLogin' } }
      end

      def session_id(redirect)
        return '' unless successful_login?(redirect)

        redirect.response.cookies['JSESSIONID']
      end

      def successful_login?(redirect)
        redirect.response.headers[:location] == '/'
      end
    end
  end
end
