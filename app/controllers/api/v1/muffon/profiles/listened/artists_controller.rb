module API
  module V1
    module Muffon
      module Profiles
        module Listened
          class ArtistsController < API::V1::Muffon::ProfilesController
            def create
              render_data_with_status
            end

            def destroy
              render_data_with_status
            end

            private

            def create_data
              ::Muffon::Profile::Listened::Artist::Creator.call(
                params.slice(
                  *%i[profile_id token name]
                )
              )
            end

            def destroy_data
              ::Muffon::Profile::Listened::Artist::Destroyer.call(
                params.slice(
                  *%i[profile_id token listened_id]
                )
              )
            end
          end
        end
      end
    end
  end
end
