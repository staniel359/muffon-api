module YandexMusic
  class Base < Muffon::Base
    BASE_LINK =
      'https://api.music.yandex.net'.freeze
    SOURCE_NAME = 'yandexmusic'.freeze

    private

    def response
      RestClient::Request.execute(
        method: :get,
        url: link,
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

    alias artist_name artist_names
  end
end
