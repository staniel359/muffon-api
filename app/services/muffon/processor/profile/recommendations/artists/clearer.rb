module Muffon
  module Processor
    module Profile
      module Recommendations
        module Artists
          class Clearer <
              Muffon::Processor::Profile::Recommendations::Artists::Base
            private

            def process_recommendations
              return if profile.blank?

              update_recommendations

              delete_empty_recommendations
            end

            def update_recommendations
              recommendations.find_each do |rec|
                rec.library_artist_ids -= [
                  @args[:library_artist_id]
                ]

                rec.save
              end
            end

            def recommendations
              profile
                .recommendation_artists
                .where(
                  '? = ANY(ARRAY[library_artist_ids])',
                  @args[:library_artist_id]
                )
            end

            def delete_empty_recommendations
              profile
                .recommendation_artists
                .where(
                  library_artist_ids: []
                ).delete_all
            end
          end
        end
      end
    end
  end
end
