module API
  module Muffon
    module Profiles
      module Bookmarks
        class VideoChannelsController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Bookmarks::VideoChannels.call(
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
            ::Muffon::Processor::Profile::Bookmarks::VideoChannel::Creator.call(
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
            ::Muffon::Processor::Profile::Bookmarks::VideoChannel::Destroyer.call(
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
