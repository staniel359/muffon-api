module Muffon
  module Processor
    module Profile
      module Recommendations
        class Base < Muffon::Processor::Profile::Base
          def call
            return if not_all_args?

            data
          end

          private

          def primary_args
            [@args[:profile_id]]
          end

          def data
            process_recommendations
          end
        end
      end
    end
  end
end
