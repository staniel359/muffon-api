module API
  module Muffon
    module Profiles
      module Listened
        class TracksController < API::Muffon::ProfilesController
          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def create_data
            ::Muffon::Processor::Profile::Listened::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token
                  title artist_name
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Listened::Track::Destroyer.call(
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
