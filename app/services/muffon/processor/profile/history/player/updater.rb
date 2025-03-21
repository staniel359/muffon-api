module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Updater < Muffon::Processor::Profile::History::Base
            private

            def primary_args
              super + [
                @args[:playing]
              ]
            end

            def process_profile
              profile
                .playing_events
                .create(
                  data: @args[:playing]
                )
            end
          end
        end
      end
    end
  end
end
