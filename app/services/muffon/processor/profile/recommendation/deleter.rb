module Muffon
  module Processor
    module Profile
      module Recommendation
        class Deleter < Muffon::Profile::Base
          private

          def forbidden?
            wrong_profile?
          end

          def data
            recommendation&.update(
              deleted: true
            )

            { success: true }
          end

          def recommendation
            profile
              .recommendations
              .find_by(
                id: @args[:recommendation_id]
              )
          end
        end
      end
    end
  end
end
