module Muffon
  module Processor
    module Profile
      module Recommendations
        class Base < Muffon::Processor::Profile::Base
          def call
            return if not_all_args?

            process_recommendations
          end

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_artist_id]
            ]
          end
        end
      end
    end
  end
end
