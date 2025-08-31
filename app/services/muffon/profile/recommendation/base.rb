module Muffon
  module Profile
    module Recommendation
      class Base < Muffon::Profile::Base
        private

        def required_args
          super + %i[
            token
            recommendation_id
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def not_found?
          recommendation.blank?
        end

        def profile_data
          {
            recommendation:
              recommendation_data
          }
        end
      end
    end
  end
end
