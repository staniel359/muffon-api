module YandexMusic
  class Base < Muffon::Base
    BASE_LINK =
      'https://music.yandex.ru/handlers'.freeze
    SOURCE_NAME = 'yandexmusic'.freeze

    private

    def proxy
      proxies[:ru]
    end

    def params
      { language: }
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data['name']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
    end

    def image_data_formatted(data)
      YandexMusic::Utils::Image.call(
        data:
      )
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end

    def label_name_formatted(
      raw_label_data
    )
      raw_label_data['name']
    end

    alias artist_name artists_names
  end
end
