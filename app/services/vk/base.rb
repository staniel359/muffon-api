module VK
  class Base < Muffon::Base
    BASE_LINK = 'https://api.vk.com'.freeze
    SOURCE_NAME = 'vk'.freeze

    private

    def response_data
      super['response']
    end

    def link
      "#{BASE_LINK}/method/#{api_method}"
    end

    def api_method
      self.class::API_METHOD
    end

    def headers
      {
        'User-Agent' => user_agent,
        params:
      }
    end

    def user_agent
      secrets.vk[:user_agent]
    end

    def params
      {
        access_token:,
        v: '5.131',
        sig: md5_signature
      }
    end

    def access_token
      secrets.vk[:access_token]
    end

    def md5_signature
      Digest::MD5.hexdigest(
        signature
      )
    end

    def api_secret
      secrets.vk[:api_secret]
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

    alias artist_name artist_names
  end
end
