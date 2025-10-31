module API
  module Spotify
    class UsersController < API::BaseController
      def info; end

      def tracks; end

      def playlists; end

      private

      def info_data
        ::Spotify::User::Info.call(
          params.slice(
            *%i[
              profile_id
              token
              access_token
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
              access_token
              page
              limit
            ]
          )
        )
      end

      def playlists_data
        ::Spotify::User::Playlists.call(
          params.slice(
            *%i[
              profile_id
              token
              access_token
              page
              limit
              with_tracks
            ]
          )
        )
      end
    end
  end
end
