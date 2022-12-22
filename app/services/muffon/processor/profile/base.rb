module Muffon
  module Processor
    module Profile
      class Base < Muffon::Profile::Base
        private

        def process_image
          profile.process_image(
            @args[:image]
          )
        end
      end
    end
  end
end
