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

            add_profile_artist

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

          def add_profile_artist
            return if profile_artist_present?

            recommendation.profile_artist_ids <<
              @args[:profile_artist_id]
          end

          def profile_artist_present?
            @args[:profile_artist_id].in?(
              recommendation.profile_artist_ids
            )
          end
        end
      end
    end
  end
end
