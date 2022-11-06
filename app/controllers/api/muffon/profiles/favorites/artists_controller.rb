module API
  module Muffon
    module Profiles
      module Favorites
        class ArtistsController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Favorites::Artists.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token page limit order
                ]
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
