module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Base < Muffon::Profile::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token]
              ]
            end

            def forbidden?
              !valid_profile?
            end

            def data
              process_library_album
            end
          end
        end
      end
    end
  end
end
