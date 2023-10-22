module API
  module Muffon
    module Profiles
      module Bookmarks
        class ArtistsController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Bookmarks::Artists.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Bookmarks::Artist::Creator.call(
              params.slice(
                *%i[profile_id token artist_name]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Bookmarks::Artist::Destroyer.call(
              params.slice(
                *%i[profile_id token bookmark_id]
              )
            )
          end
        end
      end
    end
  end
end
