module Spotify
  class Base < Muffon::Base
    BASE_LINK =
      'https://api-partner.spotify.com/pathfinder/v2/query'.freeze
    SOURCE_NAME = 'spotify'.freeze

    include Muffon::Mixins::GlobalStorage

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

    def spotify_audio_token
      return test_audio_token if test?

      @spotify_audio_token ||=
        get_global_value(
          'spotify:audio_token',
          refresh_class_name: 'Spotify::Utils::AudioToken',
          is_refresh: refresh_audio_token?
        )
    end

    def test_audio_token
      credentials.dig(
        :spotify,
        :test_audio_token
      )
    end

    def refresh_audio_token?
      !!@args[:is_refresh_audio_token]
    end

    def retry_with_new_spotify_audio_token
      return if spotify_audio_token.blank?

      self.class.call(
        **@args,
        is_refresh_audio_token: true
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
      if defined?(@spotify_connection)
        @spotify_connection
      else
        @spotify_connection = profile&.spotify_connection
      end
    end
  end
end
