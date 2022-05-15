module API
  module Muffon
    module Profiles
      class PlaylistsController < API::Muffon::ProfilesController
        def index
          render_data_with_status
        end

        def create
          render_data_with_status
        end

        def info
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
          ::Muffon::Profile::Playlists.call(
            params.slice(
              *%i[profile_id track_title artist_name page limit]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Profile::Playlist::Creator.call(
            params.slice(
              *%i[profile_id token title image]
            )
          )
        end

        def info_data
          ::Muffon::Profile::Playlist::Info.call(
            params.slice(
              *%i[profile_id playlist_id]
            )
          )
        end

        def update_data
          ::Muffon::Processor::Profile::Playlist::Updater.call(
            params.slice(
              *%i[profile_id token playlist_id title image]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Playlist::Destroyer.call(
            params.slice(
              *%i[profile_id token playlist_id]
            )
          )
        end
      end
    end
  end
end
