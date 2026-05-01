module Odnoklassniki
  module Utils
    class SessionId < Odnoklassniki::Base
      REQUEST_BASE_URL = 'https://ok.ru/dk'.freeze

      def call
        data
      end

      private

      def data
        get_response_cookie(
          raw_response:,
          cookie_name: 'JSESSIONID'
        )
      end

      def raw_response
        Muffon::Request.call(
          url: request_url,
          method: 'POST',
          response_type: 'raw',
          params: request_params,
          payload: request_payload,
          proxy: request_proxy,
          is_redirect: false
        )
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_params
        { cmd: 'AnonymLogin' }
      end

      def request_payload
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
