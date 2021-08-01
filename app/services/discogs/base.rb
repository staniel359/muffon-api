module Discogs
  class Base < Muffon::Base
    BASE_LINK = 'https://api.discogs.com'.freeze
    SOURCE_ID = 'discogs'.freeze

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      {
        key: secrets.discogs[:api_key],
        secret: secrets.discogs[:api_secret]
      }
    end

    def artists
      artists_list.map do |a|
        artist_data_formatted(a)
      end
    end

    def artist_data_formatted(data)
      {
        name: data['name'],
        discogs_id: data['id']
      }.compact
    end

    def image_data_formatted(image, model)
      Discogs::Utils::Image.call(
        image: image, model: model
      )
    end

    def image
      (
        primary_image || images_list[0]
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
