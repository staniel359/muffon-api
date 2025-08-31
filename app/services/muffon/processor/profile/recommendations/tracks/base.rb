module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Base < Muffon::Processor::Profile::Recommendations::Base
            private

            def required_args
              super + %i[
                library_track_id
              ]
            end
          end
        end
      end
    end
  end
end
