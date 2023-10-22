module API
  module Muffon
    module Profiles
      module Bookmarks
        class TracksController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Bookmarks::Tracks.call(
              params.slice(
                *%i[profile_id token page limit order]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Bookmarks::Track::Creator.call(
              params.slice(
                *%i[
                  profile_id token track_title
                  artist_name album_title image
                  source audio album_source
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Bookmarks::Track::Destroyer.call(
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
