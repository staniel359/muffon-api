module Muffon
  module Processor
    module Profile
      module Recommendation
        module Track
          class Deleter < Muffon::Processor::Profile::Recommendation::Base
            private

            def required_args
              super + %i[
                recommendation_id
              ]
            end

            def process_recommendation
              if recommendation.present?
                recommendation.update!(
                  deleted: true
                )

                recommendation.send(
                  :add_deleted_event
                )
              end

              { success: true }
            end

            def recommendation
              if defined?(@recommendation)
                @recommendation
              else
                @recommendation =
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
end
