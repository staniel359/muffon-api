module YandexMusic
  class Base < Muffon::Base
    BASE_LINK =
      'https://api.music.yandex.net'.freeze
    SOURCE_NAME = 'yandexmusic'.freeze

    def call
      super
    rescue Faraday::BadRequestError
      not_found
    end

    private

    def response
      format_get_request(
        link:,
        params:,
        headers:,
        proxy:
      )
    end

    def params
      { language: }
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['name']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }
    end

    def image_data_formatted(data)
      YandexMusic::Utils::Image.call(
        data:
      )
    end

    alias artist_name artists_names
  end
end
