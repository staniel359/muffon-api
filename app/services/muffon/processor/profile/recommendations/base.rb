module Muffon
  module Processor
    module Profile
      module Recommendations
        class Base < Muffon::Profile::Base
          def call
            return if not_all_args?

            process_recommendations
          end

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:profile_artist_id]
            ]
          end
        end
      end
    end
  end
end
