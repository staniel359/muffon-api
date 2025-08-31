module Muffon
  module Processor
    module Profile
      module History
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_profile_history
          end
        end
      end
    end
  end
end
