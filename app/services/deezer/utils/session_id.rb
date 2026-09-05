module Deezer
  module Utils
    class SessionId < Deezer::Base
      API_METHOD = 'deezer.ping'.freeze

      def call
        data
      end

      private

      def data
        response_data.dig(
          'results',
          'SESSION'
        )
      end

      def response_data
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          cookies: request_cookies,
          proxy: request_proxy
        )
      end

      def api_token
        ''
      end

      def request_cookies
        { 'arl' => arl_cookie }
      end

      def arl_cookie
        credentials.dig(
          :deezer,
          :cookies,
          :arl
        )
      end
    end
  end
end
