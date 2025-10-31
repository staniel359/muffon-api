module API
  module Muffon
    module Profiles
      module Bookmarks
        class VideosController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Bookmarks::Videos.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  page
                  limit
                  order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Bookmarks::Video::Creator.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  youtube_id
                ]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Bookmarks::Video::Destroyer.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  bookmark_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
