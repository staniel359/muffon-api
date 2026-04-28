module Muffon
  module Processor
    module Profile
      module Online
        class Updater < Muffon::Processor::Profile::Base
          private

          def required_args
            [
              *super,
              :is_online
            ]
          end

          def data
            if @args[:is_online]
              profile_record.update!(
                online: true
              )
            else
              profile_record.update!(
                online: false,
                was_online_at: current_time
              )
            end

            { success: true }
          end
        end
      end
    end
  end
end
