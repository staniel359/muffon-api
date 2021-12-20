module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Base < Muffon::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token]
              ]
            end

            def data
              return forbidden if wrong_profile?

              process_profile_track
            end
          end
        end
      end
    end
  end
end
