module Muffon
  module Processor
    module Profile
      module Recommendation
        module Track
          class Deleter < Muffon::Processor::Profile::Base
            private

            def forbidden?
              !valid_profile?
            end

            def data
              recommendation&.update(
                deleted: true
              )

              recommendation&.send(
                :add_deleted_event
              )

              { success: true }
            end

            def recommendation
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
end
