module Muffon
  module Processor
    module Profile
      module Playing
        class Updater < Muffon::Processor::Profile::Base
          private

          def data
            profile_record.update!(
              playing: @args[:playing]
            )

            { success: true }
          end
        end
      end
    end
  end
end
