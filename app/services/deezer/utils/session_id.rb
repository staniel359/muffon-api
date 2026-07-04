module Deezer
  module Utils
    class SessionId < Deezer::Base
      SESSION_COOKIE_NAME = 'sid'.freeze

      def call
        data
      end

      private

      def data
        matched_cookie_data['value']
      end

      def matched_cookie_data
        browser_session_cookies.find do |cookie_data|
          matched_cookie?(
            cookie_data
          )
        end
      end

      def browser_session_cookies
        browser_session_data['cookies']
      end

      def browser_session_data
        Muffon::Utils::Browser::SessionData.call
      end

      def matched_cookie?(
        cookie_data
      )
        cookie_data['host'] == '.deezer.com' &&
          cookie_data['name'] == SESSION_COOKIE_NAME
      end
    end
  end
end
