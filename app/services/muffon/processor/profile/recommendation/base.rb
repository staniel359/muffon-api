module Muffon
  module Processor
    module Profile
      module Recommendation
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
            process_recommendation
          end
        end
      end
    end
  end
end
