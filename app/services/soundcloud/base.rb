module SoundCloud
  class Base < Muffon::Base
    SOURCE_NAME = 'soundcloud'.freeze

    private

    def params
      { client_id: }
    end

    def proxy
      proxies[:us]
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
        name: raw_artist_data['username']
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
      SoundCloud::Utils::Image.call(
        image:
      )
    end

    def tag_name_formatted(
      tag_data
    )
      tag_data
    end
  end
end
