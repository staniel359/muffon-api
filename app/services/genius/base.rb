module Genius
  class Base < Muffon::Base
    BASE_LINK = 'https://genius.com/api'.freeze
    SOURCE_ID = 'genius'.freeze

    private

    def headers
      {
        'User-Agent' => user_agent,
        cookies:,
        params:
      }
    end

    def cookies
      { 'cf_clearance' => cf_clearance }
    end

    def cf_clearance
      secrets.genius.try(
        :[], :cf_clearance
      )
    end

    def artists
      [artist_data]
    end

    def artist_data
      {
        name: artist_name,
        genius_id: artist['id']
      }
    end

    def artist_name
      artist['name']
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
        data[
          'release_date_components'
        ] || {}
      ).values.compact
    end
  end
end
