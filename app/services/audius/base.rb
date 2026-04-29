module Audius
  class Base < Muffon::Base
    SOURCE_NAME = 'audius'.freeze
    BASE_LINK = 'https://api.audius.co/v1/full'.freeze

    private

    def params
      { api_key: }
    end

    def api_key
      credentials.dig(
        :audius,
        :api_key
      )
    end

    def image_data_formatted(images_data)
      Audius::Utils::Image.call(
        images_data:
      )
    end
  end
end
