module Discogs
  class Base < Muffon::Base
    SOURCE_NAME = 'discogs'.freeze
    BASE_LINK = 'https://api.discogs.com'.freeze

    private

    def params
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
