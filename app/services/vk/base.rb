module VK
  class Base < Muffon::Base
    SOURCE_NAME = 'vk'.freeze
    BASE_LINK = 'https://api.vk.ru'.freeze

    private

    def link
      "#{BASE_LINK}/method/#{api_method}"
    end

    def api_method
      self.class::API_METHOD
    end

    def params
      {
        access_token:,
        v: '5.131',
        sig: md5_signature
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

    def md5_signature
      Digest::MD5.hexdigest(
        signature
      )
    end

    def api_secret
      credentials.dig(
        :vk,
        :api_secret
      )
    end

    def headers
      { 'User-Agent' => user_agent }
    end

    def user_agent
      credentials.dig(
        :vk,
        :user_agent
      )
    end

    def proxy
      proxy_data[:ru].sample
    end

    def response_data
      error_data = super['error']

      raise_error(error_data) if error_data.present? && !test?

      super['response']
    end

    def raise_error(error_data)
      error_text = error_data['error_msg']

      raise not_found_error if error_text.include?('audios is invalid')

      raise "[Error (VK)]: #{error_text}"
    end
  end
end
