module Spotify
  class Base < Muffon::Base
    BASE_LINK =
      'https://api.spotify.com/v1'.freeze
    SOURCE_NAME = 'spotify'.freeze
    COUNTRY_CODE = 'GB'.freeze

    include Muffon::Utils::Global

    def call
      super
    rescue Faraday::BadRequestError
      not_found
    rescue Faraday::UnauthorizedError
      retry_with_new_spotify_token
    end

    private

    def headers
      {
        'Authorization' =>
          "Bearer #{spotify_token}"
      }
    end

    def spotify_token
      return test_token if test?

      get_global_value(
        'spotify_token'
      )
    end

    def test_token
      secrets.spotify[:test_token]
    end

    def global_value
      @global_value ||=
        Spotify::Utils::AccessToken.call
    end

    def retry_with_new_spotify_token
      return if global_value.blank?

      update_global_value(
        'spotify_token'
      )

      call
    end

    def artist_data_formatted(artist)
      {
        source:
          artist_source_data(artist),
        name: artist['name']
      }
    end

    def artist_source_data(artist)
      {
        name: source_name,
        id: artist['id']
      }
    end

    def image_data_formatted(images)
      Spotify::Utils::Image.call(
        images:
      )
    end

    alias artist_name artists_names
  end
end
