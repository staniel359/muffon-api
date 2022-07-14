module API
  module Muffon
    module Profiles
      class BackgroundImagesController < API::Muffon::ProfilesController
        def create
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

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
