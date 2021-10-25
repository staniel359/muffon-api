module API
  module V1
    module Profiles
      module Listened
        class AlbumsController < API::V1::ProfilesController
          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def create_data
            Muffon::Profile::Listened::Albums::Album::Creator.call(
              params.slice(
                *%i[profile_id token album_id image_url]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Listened::Albums::Album::Destroyer.call(
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
