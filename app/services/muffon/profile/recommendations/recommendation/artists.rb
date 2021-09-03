module Muffon
  module Profile
    class Recommendations
      class Recommendation
        class Artists < Muffon::Profile::Base
          include Muffon::Utils::Pagination

          private

          def primary_args
            [
              @args.profile_id,
              @args.token,
              @args.recommendation_id
            ]
          end

          def no_data?
            recommendation.blank?
          end

          def recommendation
            @recommendation ||=
              profile.recommendations.find_by(
                id: @args.recommendation_id
              )
          end

          def data
            return forbidden if wrong_profile?

            { recommendation: recommendation_data }
          end

          def recommendation_data
            {
              page: page,
              total_pages: total_pages_count,
              profile_artists: profile_artists_formatted
            }.compact
          end

          def total_items_count
            recommendation
              .profile_artist_ids
              .size
          end

          def profile_artists_formatted
            profile_artists_paginated.map do |a|
              profile_artist_formatted(a)
            end
          end

          def profile_artists_paginated
            profile_artists_associated
              .limit(limit)
              .offset(offset)
          end

          def profile_artists_associated
            recommendation
              .profile_artists
              .includes(:artist)
          end

          def profile_artist_formatted(artist)
            Muffon::Profile::Recommendations::Recommendation::Artist.call(
              artist: artist,
              profile_id: @args.profile_id
            )
          end
        end
      end
    end
  end
end
