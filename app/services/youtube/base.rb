module YouTube
  class Base < Muffon::Base
    BASE_LINK =
      'https://www.googleapis.com/youtube/v3'.freeze

    private

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      { key: api_key }
    end

    def api_key
      secrets.youtube[:api_key]
    end

    def image_data_formatted
      YouTube::Utils::Image.call(
        image: image
      )
    end

    def image
      snippet.dig(
        'thumbnails', 'default', 'url'
      )
    end
  end
end
