module API
  module V2
    module Muffon
      module Profiles
        module Favorites
          class ArtistsController < API::V2::Muffon::ProfilesController
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
              ::Muffon::Profile::Favorites::Artists.call(
                params.slice(
                  *%i[profile_id page limit]
                )
              )
            end

            def create_data
              ::Muffon::Processor::Profile::Favorites::Artist::Creator.call(
                params.slice(
                  *%i[profile_id token name]
                )
              )
            end

            def destroy_data
              ::Muffon::Processor::Profile::Favorites::Artist::Destroyer.call(
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
