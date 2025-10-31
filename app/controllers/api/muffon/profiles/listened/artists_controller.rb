module API
  module Muffon
    module Profiles
      module Listened
        class ArtistsController < API::Muffon::ProfilesController
          def create; end

          def destroy; end

          private

          def create_data
            ::Muffon::Processor::Profile::Listened::Artist::Creator.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  artist_name
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Listened::Artist::Destroyer.call(
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
