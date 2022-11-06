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

        def no_data?
          recommendation.blank?
        end

        def recommendation
          @recommendation ||=
            profile
            .recommendations
            .find_by(
              id: @args[:recommendation_id]
            )
        end

        def forbidden?
          wrong_profile?
        end

        def data
          { recommendation: recommendation_data }
        end
      end
    end
  end
end
