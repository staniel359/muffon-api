module Muffon
  module Processor
    module Profile
      module Recommendations
        module Tracks
          class Clearer < Muffon::Processor::Profile::Recommendations::Base
            private

            def required_args
              [
                *super,
                :library_track_id
              ]
            end

            def data
              recommendations.find_each do |recommendation_record|
                process_recommendation_record!(
                  recommendation_record
                )
              end
            end

            def process_recommendation_record!(
              recommendation_record
            )
              recommendation_record.library_track_ids -=
                [@args[:library_track_id]]

              if recommendation_record.library_track_ids.any?
                recommendation_record.save!
              else
                recommendation_record.destroy!
              end
            end

            def recommendations
              profile_record
                .recommendation_tracks
                .where(
                  '? = ANY(ARRAY[library_track_ids])',
                  @args[:library_track_id]
                )
            end
          end
        end
      end
    end
  end
end
