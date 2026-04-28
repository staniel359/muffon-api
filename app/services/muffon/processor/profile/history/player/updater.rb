module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Updater < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :playing
              ]
            end

            def data
              profile_record.add_player_history_event!(
                event_data: @args[:playing]
              )

              { success: true }
            end
          end
        end
      end
    end
  end
end
