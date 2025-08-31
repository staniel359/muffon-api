module MusixMatch
  class Base < Muffon::Base
    SOURCE_NAME = 'musixmatch'.freeze
    BASE_LINK =
      'https://api.musixmatch.com/ws/1.1'.freeze

    private

    def not_found?
      response_data
        .dig(
          'message',
          'body'
        )
        .blank?
    end

    def params
      { apikey: api_key }
    end

    def api_key
      credentials.dig(
        :musixmatch,
        :api_key
      )
    end

    def model_name
      self.class::MODEL_NAME
    end
  end
end
