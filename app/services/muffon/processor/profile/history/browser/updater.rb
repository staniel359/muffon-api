module Muffon
  module Processor
    module Profile
      module History
        module Browser
          class Updater < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :route
              ]
            end

            def data
              profile_record.add_browser_history_event!(
                event_data: @args[:route]
              )

              { success: true }
            end
          end
        end
      end
    end
  end
end
