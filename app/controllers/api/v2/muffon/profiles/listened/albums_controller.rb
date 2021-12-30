module API
  module V2
    module Muffon
      module Profiles
        module Listened
          class AlbumsController < API::V2::Muffon::ProfilesController
            def create
              render_data_with_status
            end

            def destroy
              render_data_with_status
            end

            private

            def create_data
              ::Muffon::Processor::Profile::Listened::Album::Creator.call(
                params.slice(
                  *%i[profile_id token title artist_name image_url]
                )
              )
            end

            def destroy_data
              ::Muffon::Processor::Profile::Listened::Album::Destroyer.call(
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
