module API
  module Muffon
    module Profiles
      module Listened
        class TracksController < API::Muffon::ProfilesController
          def create; end

          def destroy; end

          private

          def create_data
            ::Muffon::Processor::Profile::Listened::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  track_title
                  artist_name
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Listened::Track::Destroyer.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  listened_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
