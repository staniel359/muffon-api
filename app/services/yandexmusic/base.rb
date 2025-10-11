module YandexMusic
  class Base < Muffon::Base
    BASE_LINK =
      'https://music.yandex.ru/handlers'.freeze
    SOURCE_NAME = 'yandexmusic'.freeze

    private

    def response
      format_get_request(
        link:,
        params:,
        headers:,
        proxy:
      )
    end

    def proxy
      credentials.dig(
        :proxy,
        :ru
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
