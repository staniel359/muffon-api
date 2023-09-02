module Muffon
  module Processor
    module Profile
      module Recommendations
        module Artists
          class Base < Muffon::Processor::Profile::Recommendations::Base
            private

            def primary_args
              super + [
                @args[:library_artist_id]
              ]
            end
          end
        end
      end
    end
  end
end
