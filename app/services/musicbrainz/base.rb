module MusicBrainz
  class Base < Muffon::Base
    SOURCE_NAME = 'musicbrainz'.freeze
    REQUEST_BASE_URL = 'https://musicbrainz.org/ws/2'.freeze

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
      { fmt: 'json' }
    end
  end
end
