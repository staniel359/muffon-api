module API
  module Spotify
    class UsersController < API::BaseController
      def info; end

      def tracks; end

      private

      def info_data
        ::Spotify::User::Info.call(
          params.slice(
            *%i[
              profile_id
              token
              counters
            ]
          )
        )
      end

      def tracks_data
        ::Spotify::User::Tracks.call(
          params.slice(
            *%i[
              profile_id
              token
              page
              limit
            ]
          )
        )
      end
    end
  end
end
