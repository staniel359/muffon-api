module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      BASE_LINK = 'https://ok.ru/dk'.freeze

      def call
        data
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
          is_redirect: false
        )
      end

      def link
        BASE_LINK
      end

      def params
        { cmd: 'AnonymLogin' }
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
        credentials.dig(
          :odnoklassniki,
          :email
        )
      end

      def password
        credentials.dig(
          :odnoklassniki,
          :password
        )
      end
    end
  end
end
