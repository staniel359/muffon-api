module LastFM
  class Base < Muffon::Base
    SOURCE_NAME = 'lastfm'.freeze
    REQUEST_BASE_URL = 'https://ws.audioscrobbler.com/2.0'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params
        )
    end

    def request_url
      REQUEST_BASE_URL
    end

    def request_params
      {
        method: api_method,
        api_key:,
        format: 'json',
        autocorrect: 0
      }
    end

    def api_method
      self.class::API_METHOD
    end

    def api_key
      credentials.dig(
        :lastfm,
        :api_key
      )
    end

    def api_secret
      credentials.dig(
        :lastfm,
        :api_secret
      )
    end

    def param_formatted(
      value
    )
      value.strip
    end
  end
end
