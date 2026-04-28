module Muffon
  module Processor
    module Profile
      module Recommendations
        module Artists
          class Clearer < Muffon::Processor::Profile::Recommendations::Base
            private

            def required_args
              [
                *super,
                :library_artist_id
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
              recommendation_record.library_artist_ids -=
                [@args[:library_artist_id]]

              if recommendation_record.library_artist_ids.any?
                recommendation_record.save!
              else
                recommendation_record.destroy!
              end
            end

            def recommendations
              profile_record
                .recommendation_artists
                .where(
                  '? = ANY(ARRAY[library_artist_ids])',
                  @args[:library_artist_id]
                )
            end
          end
        end
      end
    end
  end
end
