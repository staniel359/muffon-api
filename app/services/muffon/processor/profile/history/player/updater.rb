module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Updater < Muffon::Processor::Profile::History::Base
            private

            def required_args
              super + %i[
                playing
              ]
            end

            def process_profile_history
              profile
                .playing_events
                .create(
                  data: @args[:playing]
                )

              { success: true }
            end
          end
        end
      end
    end
  end
end
