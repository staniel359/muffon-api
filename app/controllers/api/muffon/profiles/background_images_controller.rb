module API
  module Muffon
    module Profiles
      class BackgroundImagesController < API::Muffon::ProfilesController
        def create; end

        def destroy; end

        private

        def create_data
          ::Muffon::Processor::Profile::BackgroundImage::Creator.call(
            params.slice(
              *%i[profile_id token image]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::BackgroundImage::Destroyer.call(
            params.slice(
              *%i[profile_id token image_id]
            )
          )
        end
      end
    end
  end
end
