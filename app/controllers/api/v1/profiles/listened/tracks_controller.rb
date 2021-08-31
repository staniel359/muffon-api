module API
  module V1
    module Profiles
      module Listened
        class TracksController < API::V1::ProfilesController
          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def create_data
            Muffon::Profile::Listened::Tracks::Track::Creator.call(
              params.slice(
                *%i[profile_id token title artist]
              )
            )
          end

          def destroy_data
            Muffon::Profile::Listened::Tracks::Track::Destroyer.call(
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
