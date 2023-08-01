module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Destroyer < Muffon::Processor::Profile::History::Base
            private

            def process_profile
              profile
                .playing_events
                .delete_all
            end
          end
        end
      end
    end
  end
end
