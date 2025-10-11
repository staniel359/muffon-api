module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Clearer <
              Muffon::Processor::Profile::Recommendations::Tracks::Base
            private

            def process_recommendations
              update_recommendations

              delete_empty_recommendations
            end

            def update_recommendations
              recommendations.find_each do |recommendation|
                recommendation.library_track_ids -= [
                  @args[:library_track_id]
                ]

                recommendation.save
              end
            end

            def recommendations
              profile
                .recommendation_tracks
                .where(
                  '? = ANY(ARRAY[library_track_ids])',
                  @args[:library_track_id]
                )
            end

            def delete_empty_recommendations
              profile
                .recommendation_tracks
                .where(
                  library_track_ids: []
                )
                .delete_all
            end
          end
        end
      end
    end
  end
end
