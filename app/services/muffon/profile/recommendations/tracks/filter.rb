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
              .then { hide_library_tracks_filter(it) }
              .then { hide_library_artists_filter(it) }
              .then { hide_listened_tracks_filter(it) }
              .then { hide_listened_artists_filter(it) }
          end

          def recommendations_not_deleted
            profile
              .recommendation_tracks
              .not_deleted
              .joined
          end

          def hide_library_tracks_filter(
            recommendations
          )
            if hide_library_tracks?
              recommendations
                .tracks_not_in_library
            else
              recommendations
            end
          end

          def hide_library_tracks?
            @args[:hide_library_tracks].present?
          end

          def hide_library_artists_filter(
            recommendations
          )
            if hide_library_artists?
              recommendations
                .artists_not_in_library(
                  tracks_count:
                    hide_library_artists_tracks_count
                )
            else
              recommendations
            end
          end

          def hide_library_artists?
            @args[:hide_library_artists].present?
          end

          def hide_library_artists_tracks_count
            @args[:hide_library_artists_tracks_count].to_i
          end

          def hide_listened_tracks_filter(
            recommendations
          )
            if hide_listened_tracks?
              recommendations
                .tracks_not_in_listened
            else
              recommendations
            end
          end

          def hide_listened_tracks?
            @args[:hide_listened_tracks].present?
          end

          def hide_listened_artists_filter(
            recommendations
          )
            if hide_listened_artists?
              recommendations
                .artists_not_in_listened
            else
              recommendations
            end
          end

          def hide_listened_artists?
            @args[:hide_listened_artists].present?
          end
        end
      end
    end
  end
end
