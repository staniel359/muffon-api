module API
  module V1
    module Muffon
      module Profiles
        module Favorites
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
              ::Muffon::Profile::Favorites::Tracks.call(
                params.slice(
                  *%i[profile_id page limit]
                )
              )
            end

            def create_data
              ::Muffon::Profile::Favorites::Track::Creator.call(
                params.slice(
                  *%i[
                    profile_id token title
                    artist_name album_title image_url
                  ]
                )
              )
            end

            def destroy_data
              ::Muffon::Profile::Favorites::Track::Destroyer.call(
                params.slice(
                  *%i[profile_id token favorite_id]
                )
              )
            end
          end
        end
      end
    end
  end
end
