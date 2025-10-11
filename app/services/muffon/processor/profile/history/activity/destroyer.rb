module Muffon
  module Processor
    module Profile
      module History
        module Activity
          class Destroyer < Muffon::Processor::Profile::History::Base
            private

            def process_profile_history
              profile
                .related_events
                .delete_all

              { success: true }
            end
          end
        end
      end
    end
  end
end
