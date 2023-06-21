module API
  module Spotify
    class UsersController < API::BaseController
      def info; end

      def tracks; end

      private

      def info_data
        ::Spotify::User::Info.call(
          params.slice(
            *%i[profile_id token access_token]
          )
        )
      end

      def tracks_data
        ::Spotify::User::Tracks.call(
          params.slice(
            *%i[profile_id token access_token page limit]
          )
        )
      end
    end
  end
end
