module API
  module LastFM
    module Users
      class PlaylistsController < API::LastFM::UsersController
        def index; end

        def tracks; end

        private

        def index_data
          ::LastFM::User::Playlists.call(
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

        def tracks_data
          ::LastFM::User::Playlist::Tracks.call(
            params.slice(
              *%i[
                playlist_id
                profile_id
                token
                nickname
                page
              ]
            )
          )
        end
      end
    end
  end
end
