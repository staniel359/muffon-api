module Muffon
  module Processor
    module Profile
      module Online
        class Updater < Muffon::Processor::Profile::Online::Base
          private

          def required_args
            super + %i[
              online
            ]
          end

          def process_profile
            profile.online = @args[:online]

            profile.was_online_at = current_time if offline?

            profile.save!

            { success: true }
          end

          def offline?
            @args[:online].zero?
          end
        end
      end
    end
  end
end
