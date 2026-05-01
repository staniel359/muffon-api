module Bandcamp
  class Base < Muffon::Base
    SOURCE_NAME = 'bandcamp'.freeze
    REQUEST_BASE_URL = 'https://bandcamp.com/api/mobile/22'.freeze
    MODELS_TYPES_DATA = {
      'artist' => 'b',
      'album' => 'a',
      'track' => 't'
    }.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params
        )
    end
  end
end
