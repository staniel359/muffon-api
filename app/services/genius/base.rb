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
      {
        'cf_clearance' =>
          'usFCFw4JKLhTVsVJLF3r4R0VtuDwi'\
          'E2HnR2mFA4N6cg-1651338214-0-250'
      }
    end

    def user_agent
      'Mozilla/5.0 (X11; Linux x86_64)'\
        ' AppleWebKit/537.36 (KHTML, like Gecko)'\
        ' Chrome/101.0.4951.41 Safari/537.36'
    end

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
