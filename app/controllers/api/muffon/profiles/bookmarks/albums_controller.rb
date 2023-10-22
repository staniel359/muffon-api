module API
  module Muffon
    module Profiles
      module Bookmarks
        class AlbumsController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Bookmarks::Albums.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Bookmarks::Album::Creator.call(
              params.slice(
                *%i[
                  profile_id token album_title
                  artist_name image source
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Bookmarks::Album::Destroyer.call(
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
