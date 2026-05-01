module YouTube
  class Base < Muffon::Base
    SOURCE_NAME = 'youtube'.freeze
    REQUEST_BASE_URL = 'https://www.googleapis.com/youtube/v3'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params
        )
    end

    def request_params
      { key: api_key }
    end

    def api_key
      credentials.dig(
        :google,
        :api_key
      )
    end

    def payload_context_data
      credentials.dig(
        :youtube,
        :payload_context_data
      )
    end
  end
end
