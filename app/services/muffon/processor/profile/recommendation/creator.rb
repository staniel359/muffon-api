module Muffon
  module Processor
    module Profile
      module Recommendation
        class Creator < Muffon::Profile::Base
          def call
            process_recommendation
          end

          private

          def process_recommendation
            recommendation

            add_library_artist

            recommendation.save
          end

          def recommendation
            @recommendation ||=
              profile.recommendations.where(
                artist_id: find_artist.id
              ).first_or_initialize
          end

          def find_artist
            ::Artist.with_name(
              @args[:artist_name]
            )
          end

          def add_library_artist
            return if library_artist_present?

            recommendation.library_artist_ids <<
              @args[:library_artist_id]
          end

          def library_artist_present?
            @args[:library_artist_id].in?(
              recommendation.library_artist_ids
            )
          end
        end
      end
    end
  end
end
