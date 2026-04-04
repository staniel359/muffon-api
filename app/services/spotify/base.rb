module Spotify
  class Base < Muffon::Base
    BASE_LINK =
      'https://api-partner.spotify.com/pathfinder/v2/query'.freeze
    SOURCE_NAME = 'spotify'.freeze

    private

    def link
      BASE_LINK
    end

    def headers
      {
        **super,
        'Authorization' => "Bearer #{spotify_token}",
        'Client-Token' => spotify_client_token
      }
    end

    def spotify_token
      return test_token if test?

      @spotify_token ||=
        get_global_value(
          'spotify:token',
          refresh_class_name: 'Spotify::Utils::Token',
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

    def spotify_client_token
      return test_client_token if test?

      @spotify_client_token ||=
        get_global_value(
          'spotify:client_token',
          refresh_class_name: 'Spotify::Utils::ClientToken',
          is_refresh: refresh_token?
        )
    end

    def test_client_token
      credentials.dig(
        :spotify,
        :test_client_token
      )
    end

    def artist_data_formatted(
      raw_artist_data
    )
      {
        source: artist_source_data(
          raw_artist_data
        ),
        name: raw_artist_data.dig(
          'data',
          'profile',
          'name'
        ) ||
          raw_artist_data.dig(
            'profile',
            'name'
          ) ||
          raw_artist_data['name']
      }.compact
    end

    def artist_source_data(
      raw_artist_data
    )
      spotify_uri =
        raw_artist_data.dig('data', 'uri') ||
        raw_artist_data['uri']

      return if spotify_uri.blank?

      spotify_id =
        spotify_uri.sub(
          'spotify:artist:',
          ''
        )

      {
        name: source_name,
        id: spotify_id
      }
    end

    def image_data_formatted(images)
      Spotify::Utils::Image.call(
        images:
      )
    end

    def retry_with_new_session
      if update_session[:success]
        spotify_connection&.reload

        call
      else
        not_found
      end
    end

    def update_session
      Spotify::Connection::Updater.call(
        profile_id: @args[:profile_id],
        token: @args[:token]
      )
    end

    def spotify_connection
      return @spotify_connection if defined?(@spotify_connection)

      @spotify_connection = profile&.spotify_connection
    end

    def artist_name
      artists_names.presence || 'Unknown Artist'
    end
  end
end
