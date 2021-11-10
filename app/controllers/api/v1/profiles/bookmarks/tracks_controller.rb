module API
  module V1
    module Profiles
      module Bookmarks
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
            Muffon::Profile::Bookmarks::Tracks.call(
              params.slice(
                *%i[profile_id token page limit]
              )
            )
          end

          def create_data
            Muffon::Profile::Bookmarks::Tracks::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token title
                  artist_name album_title image_url
                ]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Bookmarks::Tracks::Track::Destroyer.call(
              params.slice(
                *%i[profile_id token bookmark_id]
              )
            )
          end
        end
      end
    end
  end
end
