module Spotify
  class Base < Muffon::Base
    SOURCE_NAME = 'spotify'.freeze
    REQUEST_BASE_URL =
      'https://api-partner.spotify.com/pathfinder/v2/query'.freeze

    include Muffon::Mixins::GlobalStorage
    include Muffon::Mixins::Profile

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'POST',
          payload: request_payload,
          headers: request_headers
        )
    end

    def request_url
      REQUEST_BASE_URL
    end

    def request_headers
      {
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

    def spotify_connection
      if defined?(@spotify_connection)
        @spotify_connection
      else
        @spotify_connection =
          profile_record.spotify_connection
      end
    end
  end
end
