module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Base < Muffon::Processor::Profile::Base
            private

            def data
              process_library_album
            end
          end
        end
      end
    end
  end
end
