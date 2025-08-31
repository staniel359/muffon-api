module Muffon
  module Processor
    module Profile
      module Watched
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_watched
          end
        end
      end
    end
  end
end
