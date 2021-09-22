module Muffon
  module Profile
    class Recommendations
      class Recommendation
        class Deleter < Muffon::Profile::Recommendations
          def call
            destroy_recommendation
          end

          private

          def destroy_recommendation
            return forbidden if wrong_profile?

            recommendation&.update(
              deleted: true
            )

            { success: true }
          end

          def recommendation
            profile.recommendations.find_by(
              id: @args.recommendation_id
            )
          end
        end
      end
    end
  end
end