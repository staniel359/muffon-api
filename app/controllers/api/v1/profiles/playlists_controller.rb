module API
  module V1
    module Profiles
      class PlaylistsController < API::V1::ProfilesController
        def index
          render_data_with_status
        end

        def create
          render_data_with_status
        end

        def show
          render_data_with_status
        end

        def update
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

        private

        def index_data
          Muffon::Profile::Playlists.call(
            params.slice(
              *%i[profile_id track_id]
            )
          )
        end

        def create_data
          Muffon::Profile::Playlists::Playlist::Creator.call(
            params.slice(
              *%i[profile_id token title image]
            )
          )
        end

        def show_data
          Muffon::Profile::Playlists::Playlist::Info.call(
            params.slice(
              *%i[profile_id playlist_id]
            )
          )
        end

        def update_data
          Muffon::Profile::Playlists::Playlist::Updater.call(
            params.slice(
              *%i[profile_id token playlist_id title image]
            )
          )
        end

        def destroy_data
          Muffon::Profile::Playlists::Playlist::Destroyer.call(
            params.slice(
              *%i[profile_id token playlist_id]
            )
          )
        end
      end
    end
  end
end
