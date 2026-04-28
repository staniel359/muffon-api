module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def data
              profile_record.delete_player_history!

              { success: true }
            end
          end
        end
      end
    end
  end
end
