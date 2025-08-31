module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Base < Muffon::Processor::Profile::Base
            private

            def data
              process_library_track
            end
          end
        end
      end
    end
  end
end
