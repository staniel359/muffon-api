module Muffon
  module Processor
    module Profile
      module Library
        module Artist
          class Base < Muffon::Processor::Profile::Base
            private

            def data
              process_library_artist
            end
          end
        end
      end
    end
  end
end
