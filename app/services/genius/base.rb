module Genius
  class Base < Muffon::Base
    BASE_LINK = 'https://genius.com/api'.freeze
    SOURCE_NAME = 'genius'.freeze

    private

    def proxy
      proxies[:ru]
    end

    def raw_artists
      [artist]
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

    def image_data_formatted(image)
      Genius::Utils::Image.call(
        image:
      )
    end

    def raw_release_date_formatted(data)
      date_formatted(
        raw_release_date(
          data
        )
      )
    end

    def raw_release_date(data)
      raw_release_date_items(data)
        .values
        .compact
    end

    def raw_release_date_items(data)
      data['release_date_components'] || {}
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data['name']
    end

    def next_page
      page.to_i + 1
    end
  end
end
