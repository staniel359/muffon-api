module VK
  class Base < Muffon::Base
    BASE_LINK = 'https://api.vk.ru'.freeze
    SOURCE_NAME = 'vk'.freeze

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
      proxies[:ru]
    end

    def response_data
      error = super['error']

      if error.present?
        raise "VK error: #{error['error_msg']}"
      else
        super['response']
      end
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['name']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
        .compact
    end

    def image_data_formatted(image, model)
      VK::Utils::Image.call(
        image:, model:
      )
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end

    alias artist_name artists_names
  end
end
