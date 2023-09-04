module Muffon
  module Profile
    module Recommendation
      module Track
        class Base < Muffon::Profile::Recommendation::Base
          private

          def recommendation
            @recommendation ||=
              profile
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
