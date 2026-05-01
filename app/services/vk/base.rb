module VK
  class Base < Muffon::Base
    SOURCE_NAME = 'vk'.freeze
    REQUEST_BASE_URL = 'https://api.vk.ru'.freeze

    private

    def response_data
      error_data = raw_response_data['error']

      raise_error(error_data) if error_data.present? && !test?

      raw_response_data['response']
    end

    def raw_response_data
      @raw_response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          headers: request_headers,
          proxy: request_proxy
        )
    end

    def request_url
      "#{REQUEST_BASE_URL}/method/#{api_method}"
    end

    def api_method
      self.class::API_METHOD
    end

    def request_params
      {
        access_token:,
        v: '5.131',
        sig: request_signature
      }
    end

    def access_token
      return test_access_token if test?

      access_tokens.sample
    end

    def test_access_token
      credentials.dig(
        :vk,
        :access_token
      )
    end

    def access_tokens
      credentials.dig(
        :vk,
        :access_tokens
      )
    end

    def request_signature
      Digest::MD5.hexdigest(
        request_raw_signature
      )
    end

    def api_secret
      credentials.dig(
        :vk,
        :api_secret
      )
    end

    def request_headers
      { 'User-Agent' => user_agent }
    end

    def user_agent
      credentials.dig(
        :vk,
        :user_agent
      )
    end

    def request_proxy
      proxy_data[:ru].sample
    end

    def raise_error(error_data)
      error_text = error_data['error_msg']

      raise not_found_error if error_text.include?('audios is invalid')

      raise "[Error (VK)]: #{error_text}"
    end
  end
end
