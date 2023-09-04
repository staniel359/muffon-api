module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Base < Muffon::Processor::Profile::Recommendations::Base
            private

            def primary_args
              super + [
                @args[:library_track_id]
              ]
            end
          end
        end
      end
    end
  end
end
