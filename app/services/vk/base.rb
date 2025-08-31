module VK
  class Base < Muffon::Base
    BASE_LINK = 'https://api.vk.ru'.freeze
    SOURCE_NAME = 'vk'.freeze

    private

    def response
      format_get_request(
        link:,
        params:,
        headers:,
        proxy:
      )
    end

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

    def response_data
      error = super['error']

      if error.present?
        error_formatted(error)
      else
        super['response']
      end
    end

    def error_formatted(error)
      return {} unless too_many_requests_error?(error)

      raise "VK error: #{error['error_msg']}"
    end

    def too_many_requests_error?(error)
      error['error_code'] == 9
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['name']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }.compact
    end

    def image_data_formatted(image, model)
      VK::Utils::Image.call(
        image:, model:
      )
    end

    alias artist_name artists_names
  end
end
