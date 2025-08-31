module Muffon
  module Processor
    module Profile
      module Password
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_profile
          end

          def profile
            @profile ||=
              ::Profile.with_email(
                @args[:email]
              )
          end
        end
      end
    end
  end
end
