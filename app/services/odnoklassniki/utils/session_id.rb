module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      BASE_LINK = 'https://ok.ru/dk'.freeze

      def call
        data
      rescue Faraday::TimeoutError
        nil
      end

      private

      def data
        get_cookie(
          response: post_response,
          cookie: 'JSESSIONID'
        )
      end

      def post_response
        format_post_request(
          link:,
          params:,
          payload:,
          headers:,
          proxy:,
          redirect: false
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
        { 'User-Agent' => USER_AGENT }
      end

      def params
        { cmd: 'AnonymLogin' }
      end
    end
  end
end
