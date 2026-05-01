module Discogs
  class Base < Muffon::Base
    SOURCE_NAME = 'discogs'.freeze
    REQUEST_BASE_URL = 'https://api.discogs.com'.freeze

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
      {
        key: api_key,
        secret: api_secret
      }
    end

    def api_key
      credentials.dig(
        :discogs,
        :api_key
      )
    end

    def api_secret
      credentials.dig(
        :discogs,
        :api_secret
      )
    end
  end
end
