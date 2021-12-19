module YandexMusic
  class Base < Muffon::Base
    BASE_LINK = 'https://api.music.yandex.net'.freeze
    SOURCE_ID = 'yandexmusic'.freeze

    private

    def params
      { language: 'en' }
    end

    def artists
      artists_list.map do |a|
        artist_data_formatted(a)
      end
    end

    def artist_data_formatted(artist)
      {
        name: artist['name'],
        yandex_music_id: artist['id']
      }
    end

    def image_data_formatted(data, model)
      YandexMusic::Utils::Image.call(
        data: data, model: model
      )
    end
  end
end
