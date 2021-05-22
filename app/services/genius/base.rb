module Genius
  class Base < Muffon::Base
    BASE_LINK = 'https://genius.com/api'.freeze

    private

    def response_data
      JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      {}
    end

    def artists
      artists_list.map do |a|
        artist_data_formatted(a)
      end
    end

    def artists_list
      [artist]
    end

    def artist_data_formatted(artist)
      {
        name: artist['name'],
        genius_id: artist['id']
      }
    end

    def image_data_formatted(image)
      Genius::Utils::Image.call(image: image)
    end

    def raw_release_date_formatted(data)
      date_formatted(
        raw_release_date(data)
      )
    end

    def raw_release_date(data)
      (
        data['release_date_components'] || {}
      ).values.compact
    end
  end
end
