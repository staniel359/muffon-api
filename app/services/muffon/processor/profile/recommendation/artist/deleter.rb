module Muffon
  module Processor
    module Profile
      module Recommendation
        module Artist
          class Deleter < Muffon::Processor::Profile::Recommendation::Base
            private

            def required_args
              [
                *super,
                :recommendation_id
              ]
            end

            def data
              recommendation_record.soft_delete

              { success: true }
            end

            def recommendation_record
              profile_record
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
