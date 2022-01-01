module Genius
  class Base < Muffon::Base
    BASE_LINK = 'https://genius.com/api'.freeze
    SOURCE_ID = 'genius'.freeze

    private

    def artists
      [artist_data]
    end

    def artist_data
      {
        name: artist_name,
        genius_id: artist_genius_id
      }
    end

    def artist_name
      artist['name']
    end

    def artist_genius_id
      artist['id']
    end

    def image_data_formatted(image)
      Genius::Utils::Image.call(
        image:
      )
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
