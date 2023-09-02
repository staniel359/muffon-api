module Muffon
  module Profile
    module Recommendation
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:recommendation_id]
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def no_data?
          recommendation.blank?
        end

        def profile_data
          { recommendation: recommendation_data }
        end
      end
    end
  end
end
