module YouTube
  class Base < Muffon::Base
    SOURCE_NAME = 'youtube'.freeze
    BASE_LINK =
      'https://www.googleapis.com/youtube/v3'.freeze

    private

    def items_list
      response_data['items'] || []
    end

    def params
      { key: api_key }
    end

    def api_key
      credentials.dig(
        :google,
        :api_key
      )
    end

    def image_data_formatted(
      model:,
      images: nil,
      image: nil
    )
      YouTube::Utils::Image.call(
        images:,
        image:,
        model:
      )
    end
  end
end
