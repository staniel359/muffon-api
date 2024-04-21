module Spotify
  module Connection
    class Updater < Spotify::Connection::Base
      private

      def process_profile
        return forbidden if
            access_token_data.blank?

        spotify_connection.update(
          spotify_connection_params
        )

        return spotify_connection.errors_data if
            spotify_connection.errors?

        { success: true }
      end

      def access_token_data
        @access_token_data ||=
          Spotify::Utils::User::AccessToken::Refresh.call(
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
      end

      def spotify_connection
        @spotify_connection ||=
          profile.spotify_connection
      end

      def spotify_connection_params
        access_token_data.slice(
          :access_token
        )
      end
    end
  end
end
