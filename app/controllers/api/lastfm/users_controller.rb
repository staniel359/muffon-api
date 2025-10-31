module API
  module LastFM
    class UsersController < API::BaseController
      def info; end

      def plays; end

      def playlists; end

      private

      def info_data
        ::LastFM::User::Info.call(
          params.slice(
            *%i[
              profile_id
              token
              nickname
              counters
            ]
          )
        )
      end

      def plays_data
        ::LastFM::User::Plays.call(
          params.slice(
            *%i[
              profile_id
              token
              nickname
              page
              limit
            ]
          )
        )
      end

      def playlists_data
        ::LastFM::User::Playlists.call(
          params.slice(
            *%i[
              profile_id
              token
              nickname
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
