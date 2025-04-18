module Muffon
  module Processor
    module Profile
      module History
        module Browser
          class Updater < Muffon::Processor::Profile::History::Base
            private

            def primary_args
              super + [
                @args[:route]
              ]
            end

            def process_profile
              profile
                .browser_events
                .create(
                  data: @args[:route]
                )
            end
          end
        end
      end
    end
  end
end
