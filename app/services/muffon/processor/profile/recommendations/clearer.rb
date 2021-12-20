module Muffon
  module Processor
    module Profile
      module Recommendations
        class Clearer < Muffon::Processor::Profile::Recommendations::Base
          private

          def process_recommendations
            update_recommendations

            delete_empty_recommendations
          end

          def update_recommendations
            recommendations.find_each do |rec|
              rec.profile_artist_ids -= [
                @args[:profile_artist_id]
              ]

              rec.save
            end
          end

          def recommendations
            profile.recommendations.where(
              '? = ANY(ARRAY[profile_artist_ids])',
              @args[:profile_artist_id]
            )
          end

          def delete_empty_recommendations
            profile.recommendations.where(
              profile_artist_ids: []
            ).delete_all
          end
        end
      end
    end
  end
end
