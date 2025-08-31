module Muffon
  module Processor
    module Profile
      module Playing
        class Updater < Muffon::Processor::Profile::Playing::Base
          private

          def process_profile
            profile.update!(
              playing:
            )

            { success: true }
          end

          def playing
            @args[:playing]
          end
        end
      end
    end
  end
end
