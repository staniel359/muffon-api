module YandexMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'yandexmusic'.freeze
    BASE_LINK = 'https://music.yandex.ru/handlers'.freeze

    private

    def proxy
      proxy_data[:ru].sample
    end

    def params
      { language: }
    end
  end
end
