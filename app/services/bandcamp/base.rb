module Bandcamp
  class Base < Muffon::Base
    SOURCE_ID = 'bandcamp'.freeze
    BASE_LINK = 'https://bandcamp.com/api/mobile/22'.freeze

    private

    def no_data?
      response_data.blank? ||
        response_data['error']
    end

    def album_track_link
      "#{BASE_LINK}/tralbum_details"
    end

    def artist_label_link
      "#{BASE_LINK}/band_details"
    end

    def albums
      @albums ||= [
        album_data_formatted
      ].compact.presence
    end

    def image_data_formatted(image, model)
      Bandcamp::Utils::Image.call(
        image: image,
        model: model
      )
    end

    def image(data)
      'https://f4.bcbits.com/img'\
        "/a#{data['art_id']}_10.jpg"
    end
  end
end
