module YouTube
  class Base < Muffon::Base
    SOURCE_NAME = 'youtube'.freeze
    BASE_LINK = 'https://www.googleapis.com/youtube/v3'.freeze

    private

    def params
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
