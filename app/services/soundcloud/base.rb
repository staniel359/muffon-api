module SoundCloud
  class Base < Muffon::Base
    SOURCE_NAME = 'soundcloud'.freeze

    private

    def response_data
      super
    rescue Faraday::BadRequestError
      {}
    end

    def params
      { client_id: }
    end

    def artists_list
      [artist]
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['username']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }
    end

    def image_data_formatted(image)
      SoundCloud::Utils::Image.call(
        image:
      )
    end
  end
end
