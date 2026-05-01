module Audius
  class Base < Muffon::Base
    SOURCE_NAME = 'audius'.freeze
    REQUEST_BASE_URL = 'https://api.audius.co/v1/full'.freeze

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
      { api_key: }
    end

    def api_key
      credentials.dig(
        :audius,
        :api_key
      )
    end
  end
end
