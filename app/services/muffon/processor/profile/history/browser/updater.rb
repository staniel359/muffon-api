module Muffon
  module Processor
    module Profile
      module History
        module Browser
          class Updater < Muffon::Processor::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:route]
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
