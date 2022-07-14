module Muffon
  module Processor
    module Profile
      module BackgroundImage
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token]
            ]
          end

          def no_data?
            profile.blank?
          end

          def profile_data
            return forbidden if wrong_profile?

            process_background_image
          end
        end
      end
    end
  end
end
