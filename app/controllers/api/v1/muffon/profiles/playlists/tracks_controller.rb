module API
  module V1
    module Muffon
      module Profiles
        module Playlists
          class TracksController < API::V1::Muffon::ProfilesController
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
              ::Muffon::Profile::Playlist::Tracks.call(
                params.slice(
                  *%i[profile_id playlist_id page limit]
                )
              )
            end

            def create_data
              ::Muffon::Profile::Playlist::Track::Creator.call(
                params.slice(
                  *%i[
                    profile_id token playlist_id title
                    artist_name album_title image_url
                  ]
                )
              )
            end

            def destroy_data
              ::Muffon::Profile::Playlist::Track::Destroyer.call(
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
end