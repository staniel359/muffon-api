module API
  module Spotify
    module Users
      class PlaylistsController < API::Spotify::UsersController
        def index; end

        def tracks; end

        private

        def index_data
          ::Spotify::User::Playlists.call(
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

        def tracks_data
          ::Spotify::User::Playlist::Tracks.call(
            params.slice(
              *%i[
                playlist_id
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
end
