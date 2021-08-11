module API
  module V1
    module Profiles
      module Library
        class TracksController < API::V1::Profiles::LibraryController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def info
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            Muffon::Profile::Library::Tracks.call(
              params.slice(
                *%i[profile_id limit page]
              )
            )
          end

          def create_data
            Muffon::Profile::Library::Tracks::Track::Creator.call(
              create_params
            )
          end

          def create_params
            params.slice(
              *%i[
                profile_id token title
                artist album image
                image_url created_at
              ]
            )
          end

          def info_data
            Muffon::Profile::Library::Track::Info.call(
              params.slice(
                *%i[profile_id track_id]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Library::Tracks::Track::Destroyer.call(
              params.slice(
                *%i[profile_id token track_id]
              )
            )
          end
        end
      end
    end
  end
end