module SoundCloud
  class Base < Muffon::Base
    SOURCE_ID = 'soundcloud'.freeze

    private

    def response_data
      @response_data ||= JSON.parse(response)
    rescue RestClient::BadRequest
      nil
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      { client_id: client_id }
    end

    def artists
      [artist_data_formatted]
    end

    def artist_data_formatted
      {
        name: artist['username'],
        soundcloud_id: artist['id']
      }
    end

    def image_data_formatted(image, model)
      SoundCloud::Utils::Image.call(
        image: image, model: model
      )
    end
  end
end
