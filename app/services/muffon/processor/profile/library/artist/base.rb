module Muffon
  module Processor
    module Profile
      module Library
        module Artist
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

              process_library_artist
            end
          end
        end
      end
    end
  end
end
