module Muffon
  module Profile
    module Recommendation
      class Info < Muffon::Profile::Recommendation::Base
        private

        def recommendation_data
          Muffon::Profile::Recommendations::Recommendation.call(
            recommendation: recommendation
          )
        end
      end
    end
  end
end
