module Spotify
  class Base < Muffon::Base
    BASE_LINK = 'https://api.spotify.com/v1'.freeze
    SOURCE_ID = 'spotify'.freeze
    include Muffon::Utils::Global

    def call
      super
    rescue RestClient::Unauthorized
      retry_with_new_spotify_token
    end

    private

    def headers
      {
        params: params,
        'Authorization' => "Bearer #{spotify_token}"
      }
    end

    def spotify_token
      return test_token if
          Rails.env.test?

      get_global_value(
        'spotify_token'
      )
    end

    def test_token
      secrets.spotify[:token]
    end

    def global_value
      @global_value ||=
        Spotify::Utils::Token.call
    end

    def retry_with_new_spotify_token
      return if global_value.blank?

      update_global_value(
        'spotify_token'
      )

      call
    end

    def artist_name
      artist_names
    end

    def artist_data_formatted(artist)
      {
        name: artist['name'],
        spotify_id: artist['id']
      }
    end

    def image_data_formatted(data, model)
      Spotify::Utils::Image.call(
        data:, model:
      )
    end
  end
end
