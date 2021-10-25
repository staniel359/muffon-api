module API
  module V1
    module Profiles
      module Playlists
        class TracksController < API::V1::ProfilesController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            Muffon::Profile::Playlists::Playlist::Tracks.call(
              params.slice(
                *%i[profile_id playlist_id]
              )
            )
          end

          def create_data
            Muffon::Profile::Playlists::Playlist::Tracks::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token playlist_id
                  track_id album image_url
                ]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Playlists::Playlist::Tracks::Track::Destroyer.call(
              params.slice(
                *%i[profile_id token playlist_id playlist_track_id]
              )
            )
          end
        end
      end
    end
  end
end
