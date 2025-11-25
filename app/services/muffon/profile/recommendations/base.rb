module Muffon
  module Profile
    module Recommendations
      class Base < Muffon::Profile::Base
        private

        def forbidden?
          !valid_profile?
        end

        def profile_data
          { recommendations: recommendations_data }
        end
      end
    end
  end
end
