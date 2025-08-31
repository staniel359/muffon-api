module Muffon
  module Processor
    module Profile
      module Message
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_message
          end
        end
      end
    end
  end
end
