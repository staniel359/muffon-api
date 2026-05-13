module Muffon
  module Profile
    module Recommendations
      class Tracks
        class Filter < Muffon::Profile::Recommendations::Tracks
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              profile_id
              hide_library_tracks
              hide_library_artists
              hide_library_artists_tracks_count
              hide_listened_tracks
            ]
          end

          def data
            collection =
              hide_library_tracks_filter(
                recommendations
              )

            collection =
              hide_library_artists_filter(
                collection
              )

            collection =
              hide_listened_tracks_filter(
                collection
              )

            hide_listened_artists_filter(
              collection
            )
          end

          def recommendations
            profile_record
              .recommendation_tracks
              .not_deleted
              .joined
          end

          def hide_library_tracks_filter(
            recommendations
          )
            if @args[:hide_library_tracks].present?
              recommendations.tracks_not_in_library(
                profile_id: @args[:profile_id]
              )
            else
              recommendations
            end
          end

          def hide_library_artists_filter(
            recommendations
          )
            if @args[:hide_library_artists].present?
              recommendations.artists_not_in_library(
                profile_id: @args[:profile_id],
                tracks_count:
                  @args[:hide_library_artists_tracks_count].to_i
              )
            else
              recommendations
            end
          end

          def hide_listened_tracks_filter(
            recommendations
          )
            if @args[:hide_listened_tracks].present?
              recommendations.tracks_not_in_listened(
                profile_id: @args[:profile_id]
              )
            else
              recommendations
            end
          end

          def hide_listened_artists_filter(
            recommendations
          )
            if @args[:hide_listened_artists].present?
              recommendations.artists_not_in_listened(
                profile_id: @args[:profile_id]
              )
            else
              recommendations
            end
          end
        end
      end
    end
  end
end
