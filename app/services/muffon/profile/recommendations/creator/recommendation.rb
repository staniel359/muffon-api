module Muffon
  module Profile
    class Recommendations
      class Creator
        class Recommendation < Muffon::Profile::Recommendations::Creator
          def call
            process_recommendation
          end

          private

          def process_recommendation
            recommendation

            add_profile_artist unless
                profile_artist_present?

            recommendation.save
          end

          def recommendation
            @recommendation ||= ::Recommendation.where(
              profile_id: @args[:profile_id],
              artist_id: find_artist.id
            ).first_or_initialize
          end

          def find_artist
            ::Artist.with_name(
              @args[:artist_name]
            )
          end

          def profile_artist_present?
            @args[:profile_artist_id].in?(
              recommendation.profile_artist_ids
            )
          end

          def add_profile_artist
            recommendation.profile_artist_ids <<
              @args[:profile_artist_id]
          end
        end
      end
    end
  end
end
