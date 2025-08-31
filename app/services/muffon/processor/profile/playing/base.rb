module Muffon
  module Processor
    module Profile
      module Playing
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_profile
          end
        end
      end
    end
  end
end
