module Deezer
  class Base < Muffon::Base
    SOURCE_NAME = 'deezer'.freeze
    REQUEST_BASE_URL =
      'https://www.deezer.com/ajax/gw-light.php'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'POST',
          params: request_params,
          payload: request_payload,
          cookies: request_cookies,
          proxy: request_proxy
        )
    end

    def request_url
      REQUEST_BASE_URL
    end

    def request_params
      {
        method: api_method,
        api_version: '1.0',
        api_token:
      }
    end

    def api_method
      self.class::API_METHOD
    end

    def api_token
      user_tokens_data[:api_token]
    end

    def user_tokens_data
      @user_tokens_data ||= Deezer::Utils::Token::User.call
    end

    def request_payload
      {}
    end

    def request_cookies
      { sid: session_id }
    end

    def session_id
      credentials.dig(
        :deezer,
        :session_id
      )
    end

    def request_proxy
      @request_proxy ||=
        proxy_data
        .dig(:uk, :ipv4)
        .sample
    end
  end
end
