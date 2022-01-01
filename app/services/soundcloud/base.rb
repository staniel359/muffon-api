module SoundCloud
  class Base < Muffon::Base
    SOURCE_ID = 'soundcloud'.freeze

    private

    def response_data
      super
    rescue RestClient::BadRequest
      nil
    end

    def params
      { client_id: client_id }
    end

    def artists
      [artist_data]
    end

    def artist_data
      {
        name: artist_name,
        soundcloud_id: artist_soundcloud_id
      }
    end

    def artist_name
      artist['username']
    end

    def artist_soundcloud_id
      artist['id']
    end

    def image_data_formatted(image, model)
      SoundCloud::Utils::Image.call(
        image:, model:
      )
    end
  end
end
