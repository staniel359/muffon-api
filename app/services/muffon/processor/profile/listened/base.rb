module Muffon
  module Processor
    module Profile
      module Listened
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_listened
          end
        end
      end
    end
  end
end
