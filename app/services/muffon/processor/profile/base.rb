module Muffon
  module Processor
    module Profile
      class Base < Muffon::Profile::Base
        private

        def required_args
          super + %i[
            token
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def process_image
          profile.process_image(
            @args[:image]
          )
        end
      end
    end
  end
end
