module Spotify
  module User
    class Base < Spotify::Base
      private

      def primary_args
        return primary_test_args if test?

        [
          @args[:profile_id],
          @args[:token]
        ]
      end

      def no_data?
        return false if test?

        profile.blank?
      end

      def forbidden?
        return false if test?

        !valid_profile?
      end

      def primary_test_args
        [@args[:access_token]]
      end

      def data
        { user: user_data }
      rescue RestClient::Unauthorized
        return not_found if test?

        retry_with_new_session
      end

      def link
        "#{BASE_LINK}/me"
      end

      def headers
        {
          'Authorization' =>
            "Bearer #{access_token}",
          'Content-Type' =>
            'application/x-www-form-urlencoded',
          params:
        }
      end

      def access_token
        @args[:access_token] ||
          spotify_connection&.access_token
      end

      def spotify_connection
        @spotify_connection ||=
          profile.spotify_connection
      end

      def retry_with_new_session
        update_session

        spotify_connection.reload

        call
      end

      def update_session
        Spotify::Connection::Updater.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          refresh_token:
        )
      end

      def refresh_token
        spotify_connection.refresh_token
      end
    end
  end
end
