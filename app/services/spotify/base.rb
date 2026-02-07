module Spotify
  class Base < Muffon::Base
    BASE_LINK = 'https://api.spotify.com/v1'.freeze
    SOURCE_NAME = 'spotify'.freeze

    private

    def headers
      { 'Authorization' => "Bearer #{spotify_token}" }
    end

    def spotify_token
      return test_token if test?

      @spotify_token ||=
        get_global_value(
          'spotify:token',
          refresh_class_name:
            'Spotify::Utils::Token',
          is_refresh: refresh_token?
        )
    end

    def test_token
      credentials.dig(
        :spotify,
        :test_token
      )
    end

    def refresh_token?
      !!@args[:is_refresh_token]
    end

    def retry_with_new_spotify_token
      return if spotify_token.blank?

      self.class.call(
        **@args,
        is_refresh_token: true
      )
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name:
          raw_artist_data['name'] ||
            raw_artist_data['type']
      }
    end

    def artist_source_data(
      raw_artist_data
    )
      {
        name: source_name,
        id: raw_artist_data['id']
      }
    end

    def image_data_formatted(images)
      Spotify::Utils::Image.call(
        images:
      )
    end

    def retry_with_new_session
      session_update_result = update_session

      return not_found unless
          session_update_result[:success]

      spotify_connection&.reload

      call
    end

    def update_session
      Spotify::Connection::Updater.call(
        profile_id: @args[:profile_id],
        token: @args[:token]
      )
    end

    def spotify_connection
      @spotify_connection ||=
        profile&.spotify_connection
    end

    def artist_name
      artists_names.presence || 'Unknown Artist'
    end
  end
end
