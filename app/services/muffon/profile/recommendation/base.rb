module Muffon
  module Profile
    module Recommendation
      class Base < Muffon::Profile::Base
        private

        def required_args
          [
            *super,
            :token,
            :recommendation_id
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def profile_data
          { recommendation: recommendation_data }
        end
      end
    end
  end
end
