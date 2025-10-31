module API
  module Muffon
    module Profiles
      module Watched
        class VideosController < API::Muffon::ProfilesController
          def create; end

          def destroy; end

          private

          def create_data
            ::Muffon::Processor::Profile::Watched::Video::Creator.call(
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
            ::Muffon::Processor::Profile::Watched::Video::Destroyer.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  watched_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
