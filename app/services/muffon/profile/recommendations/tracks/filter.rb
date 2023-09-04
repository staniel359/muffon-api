module Muffon
  module Profile
    module Recommendations
      class Tracks
        class Filter < Muffon::Profile::Recommendations::Tracks
          def call
            data
          end

          private

          def data
            recommendations_not_deleted
              .then { |r| hide_library_tracks_filter(r) }
              .then { |r| hide_library_artists_filter(r) }
              .then { |r| hide_listened_tracks_filter(r) }
              .then { |r| hide_listened_artists_filter(r) }
          end

          def recommendations_not_deleted
            profile
              .recommendation_tracks
              .not_deleted
          end

          def hide_library_tracks_filter(recommendations)
            return recommendations if
                @args[:hide_library_tracks].blank?

            recommendations.tracks_not_in_library(
              @args[:profile_id]
            )
          end

          def hide_library_artists_filter(recommendations)
            return recommendations if
                @args[:hide_library_artists].blank?

            recommendations.artists_not_in_library(
              @args[:profile_id],
              @args[:hide_library_artists_tracks_count]
            )
          end

          def hide_listened_tracks_filter(recommendations)
            return recommendations if
                @args[:hide_listened_tracks].blank?

            recommendations.tracks_not_in_listened(
              @args[:profile_id]
            )
          end

          def hide_listened_artists_filter(recommendations)
            return recommendations if
                @args[:hide_listened_artists].blank?

            recommendations.artists_not_in_listened(
              @args[:profile_id]
            )
          end
        end
      end
    end
  end
end
