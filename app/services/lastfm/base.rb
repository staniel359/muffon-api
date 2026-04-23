module LastFM
  class Base < Muffon::Base
    SOURCE_NAME = 'lastfm'.freeze
    BASE_LINK = 'https://ws.audioscrobbler.com/2.0'.freeze

    private

    def link
      BASE_LINK
    end

    def params
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
