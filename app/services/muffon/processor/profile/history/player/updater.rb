module Muffon
  module Processor
    module Profile
      module History
        module Player
          class Updater < Muffon::Processor::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:playing]
              ]
            end

            def forbidden?
              !valid_profile?
            end

            def profile_data
              process_profile

              { success: true }
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
