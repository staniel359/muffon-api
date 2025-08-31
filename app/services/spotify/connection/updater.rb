module Spotify
  module Connection
    class Updater < Spotify::Connection::Base
      private

      def forbidden?
        super ||
          access_token_data.blank?
      end

      def access_token_data
        @access_token_data ||=
          Spotify::Utils::User::AccessToken::Refresh.call(
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
      end

      def process_profile
        spotify_connection.update(
          spotify_connection_params
        )

        if spotify_connection.errors?
          spotify_connection.errors_data
        else
          { success: true }
        end
      end

      def spotify_connection_params
        {
          access_token:
            access_token_data[:access_token]
        }
      end
    end
  end
end
