module YandexMusic
  class Base < Muffon::Base
    BASE_LINK = 'https://music.yandex.ru/handlers'.freeze
    SOURCE_ID = 'yandexmusic'.freeze

    private

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      { lang: 'en' }
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
