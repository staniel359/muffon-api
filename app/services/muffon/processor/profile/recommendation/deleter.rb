module Muffon
  module Processor
    module Profile
      module Recommendation
        class Deleter < Muffon::Profile::Base
          def call
            delete_recommendation
          end

          private

          def delete_recommendation
            return forbidden if wrong_profile?

            recommendation&.update(
              deleted: true
            )

            { success: true }
          end

          def recommendation
            profile.recommendations.find_by(
              id: @args[:recommendation_id]
            )
          end
        end
      end
    end
  end
end
