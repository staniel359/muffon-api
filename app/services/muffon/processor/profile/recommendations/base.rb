module Muffon
  module Processor
    module Profile
      module Recommendations
        class Base < Muffon::Processor::Profile::Base
          private

          def required_args
            %i[
              profile_id
            ]
          end

          def forbidden?
            false
          end

          def data
            process_recommendations
          end
        end
      end
    end
  end
end
