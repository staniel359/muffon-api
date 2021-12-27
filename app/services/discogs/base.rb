module Discogs
  class Base < Muffon::Base
    BASE_LINK = 'https://api.discogs.com'.freeze
    SOURCE_ID = 'discogs'.freeze

    private

    def no_data?
      response_data.blank?
    end

    def params
      {
        key: api_key,
        secret: api_secret
      }
    end

    def api_key
      secrets.discogs[:api_key]
    end

    def api_secret
      secrets.discogs[:api_secret]
    end

    def artist_data_formatted(artist)
      {
        name: artist_name_formatted(artist['name']),
        discogs_id: artist['id']
      }.compact
    end

    def artist_name_formatted(name)
      name.split(
        / \(\d+\)$/
      )[0]
    end

    def image_data_formatted(image, model)
      Discogs::Utils::Image.call(
        image: image, model: model
      )
    end

    def image
      (
        primary_image ||
          images_list[0]
      ).try(:[], 'uri')
    end

    def primary_image
      images_list.find do |i|
        i['type'] == 'primary'
      end
    end

    def images_list
      response_data['images']
    end

    def description
      Discogs::Utils::Description.call(
        description: response_data['notes']
      )
    end
  end
end
