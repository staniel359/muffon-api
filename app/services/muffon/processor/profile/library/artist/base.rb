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

            def forbidden?
              wrong_profile?
            end

            def data
              process_library_artist
            end
          end
        end
      end
    end
  end
end
