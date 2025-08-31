module Muffon
  module Processor
    module Profile
      module History
        module Browser
          class Updater < Muffon::Processor::Profile::History::Base
            private

            def required_args
              super + %i[
                route
              ]
            end

            def process_profile_history
              profile
                .browser_events
                .create(
                  data: @args[:route]
                )

              { success: true }
            end
          end
        end
      end
    end
  end
end
