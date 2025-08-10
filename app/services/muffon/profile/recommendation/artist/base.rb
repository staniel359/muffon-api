module Muffon
  module Profile
    module Recommendation
      module Artist
        class Base < Muffon::Profile::Recommendation::Base
          private

          def recommendation
            if instance_variable_defined?(
              :@recommendation
            )
              @recommendation
            else
              @recommendation =
                profile
                .recommendation_artists
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
