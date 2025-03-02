module Spotify
  module Connection
    class Creator < Spotify::Connection::Base
      private

      def primary_args
        super + [
          @args[:code]
        ]
      end

      def forbidden?
        super ||
          access_token_data.blank? ||
          spotify_user_info_data.blank?
      end

      def access_token_data
        @access_token_data ||=
          Spotify::Utils::User::AccessToken.call(
            code: @args[:code],
            client_id: @args[:client_id],
            client_secret:
              @args[:client_secret]
          )
      end

      def spotify_user_info_data
        @spotify_user_info_data ||=
          Spotify::User::Info.call(
            access_token:,
            skip_profile: true
          ).try(
            :[], :user
          )
      end

      def access_token
        access_token_data[:access_token]
      end

      def process_profile
        spotify_connection.update(
          spotify_connection_params
        )

        return spotify_connection.errors_data if
            spotify_connection.errors?

        { profile: profile_data }
      end

      def spotify_connection
        @spotify_connection ||=
          SpotifyConnection.where(
            profile_id: @args[:profile_id]
          ).first_or_initialize
      end

      def spotify_connection_params
        {
          **spotify_connection_token_params,
          **spotify_connection_info_params,
          **spotify_connection_client_params
        }
      end

      def spotify_connection_token_params
        access_token_data.slice(
          :access_token,
          :refresh_token
        )
      end

      def spotify_connection_info_params
        spotify_user_info_data.slice(
          *SpotifyConnection::DATA_KEYS
        )
      end

      def spotify_connection_client_params
        {
          client_id: @args[:client_id],
          client_secret:
            @args[:client_secret]
        }
      end

      def profile_data
        { connections: connections_data }
      end

      def connections_data
        { spotify: spotify_data }
      end

      def spotify_data
        profile
          .spotify_connection
          .slice(
            *SpotifyConnection::DATA_KEYS
          )
      end
    end
  end
end
