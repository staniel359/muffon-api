module Muffon
  module Processor
    module Profile
      module History
        module Activity
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def data
              profile_record.delete_activity_history!

              { success: true }
            end
          end
        end
      end
    end
  end
end
