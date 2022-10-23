module API
  module Muffon
    module Profiles
      module Favorites
        class AlbumsController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Favorites::Albums.call(
              params.slice(
                *%i[
                  profile_id token page limit
                  order other_profile_id
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Favorites::Album::Creator.call(
              params.slice(
                *%i[profile_id token title artist image]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Favorites::Album::Destroyer.call(
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
