module Discogs
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(api_response)
    end

    def api_response
      RestClient.get(link, headers)
    end

    def base_link
      'https://api.discogs.com'
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

    def artist_data
      { name: artist_name(response_data['artists']) }
    end

    def artist_name(artists)
      Discogs::Utils::ArtistName.call(artists: artists)
    end

    def albums_data
      albums_list.map { |a| album_data(a) }
    end

    def albums_list
      response_data['releases'] || response_data['versions']
    end

    def images_data(image, model)
      Discogs::Utils::Images.call(image: image, model: model)
    end

    def main_image
      Discogs::Utils::MainImage.call(response_data: response_data)
    end

    def length_formatted(length)
      Discogs::Utils::Length.call(length: length)
    end

    def description
      Discogs::Utils::Description.call(description: response_data['notes'])
    end

    def tracks_data
      Discogs::Utils::Tracks.call(response_data: response_data)
    end
  end
end
