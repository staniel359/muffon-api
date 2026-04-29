module Muffon
  module Profile
    module Recommendation
      module Track
        class Base < Muffon::Profile::Recommendation::Base
          private

          def recommendation_record
            if defined?(@recommendation_record)
              @recommendation_record
            else
              @recommendation_record =
                profile_record
                .recommendation_tracks
                .find_by(
                  id: @args[:recommendation_id]
                )
            end
          end
        end
      end
    end
  end
end
