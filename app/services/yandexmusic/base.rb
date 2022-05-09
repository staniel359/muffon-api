module YandexMusic
  class Base < Muffon::Base
    BASE_LINK = 'https://api.music.yandex.net'.freeze
    SOURCE_ID = 'yandexmusic'.freeze

    private

    def params
      { language: }
    end

    def artist_name
      artist_names
    end

    def artist_data_formatted(artist)
      {
        name: artist['name'],
        yandex_music_id: artist['id']
      }
    end

    def image_data_formatted(data)
      YandexMusic::Utils::Image.call(
        data:
      )
    end
  end
end
