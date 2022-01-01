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

            def data
              return forbidden if wrong_profile?

              process_profile_album
            end
          end
        end
      end
    end
  end
end