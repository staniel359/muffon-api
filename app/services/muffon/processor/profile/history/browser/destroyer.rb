module Muffon
  module Processor
    module Profile
      module History
        module Browser
          class Destroyer < Muffon::Processor::Profile::History::Base
            private

            def process_profile
              profile
                .browser_events
                .delete_all
            end
          end
        end
      end
    end
  end
end
