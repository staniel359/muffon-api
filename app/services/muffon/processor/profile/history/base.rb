module Muffon
  module Processor
    module Profile
      module History
        class Base < Muffon::Processor::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token]
            ]
          end

          def forbidden?
            !valid_profile?
          end

          def profile_data
            process_profile

            { success: true }
          end
        end
      end
    end
  end
end
