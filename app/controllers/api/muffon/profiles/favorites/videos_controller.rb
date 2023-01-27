module API
  module Muffon
    module Profiles
      module Favorites
        class VideosController < API::Muffon::ProfilesController
          def index; end

          def create; end

          def destroy; end

          private

          def index_data
            ::Muffon::Profile::Favorites::Videos.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token page limit order
                ]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Profile::Favorites::Video::Creator.call(
              params.slice(
                *%i[profile_id token youtube_id]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Profile::Favorites::Video::Destroyer.call(
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
