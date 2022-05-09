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
      { client_id: }
    end

    def artists_list
      [artist]
    end

    def artist_data_formatted(artist)
      {
        name: artist['username'],
        soundcloud_id: artist['id']
      }
    end

    def image_data_formatted(image)
      SoundCloud::Utils::Image.call(
        image:
      )
    end
  end
end
