module API
  module V2
    module Muffon
      module Profiles
        module Bookmarks
          class TracksController < API::V2::Muffon::ProfilesController
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
              ::Muffon::Profile::Bookmarks::Tracks.call(
                params.slice(
                  *%i[profile_id token page limit]
                )
              )
            end

            def create_data
              ::Muffon::Processor::Profile::Bookmarks::Track::Creator.call(
                params.slice(
                  *%i[
                    profile_id token title
                    artist_name album_title image_url
                  ]
                )
              )
            end

            def destroy_data
              ::Muffon::Processor::Profile::Bookmarks::Track::Destroyer.call(
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
end
