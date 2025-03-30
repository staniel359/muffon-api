module Muffon
  module Profile
    module Recommendations
      class Artists
        class Filter < Muffon::Profile::Recommendations::Artists
          def call
            data
          end

          private

          def data
            recommendations_not_deleted
              .then { hide_library_artists_filter(it) }
              .then { hide_listened_artists_filter(it) }
              .then { tags_include_filter(it) }
              .then { tags_exclude_filter(it) }
              .then { artists_include_filter(it) }
              .then { artists_exclude_filter(it) }
          end

          def recommendations_not_deleted
            profile
              .recommendation_artists
              .not_deleted
              .joined
          end

          def hide_library_artists_filter(
            recommendations
          )
            if hide_library_artists?
              recommendations
                .artists_not_in_library(
                  profile_id:,
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

          def profile_id
            @args[:profile_id]
          end

          def hide_library_artists_tracks_count
            @args[:hide_library_artists_tracks_count].to_i
          end

          def hide_listened_artists_filter(
            recommendations
          )
            if hide_listened_artists?
              recommendations
                .artists_not_in_listened(
                  profile_id:
                )
            else
              recommendations
            end
          end

          def hide_listened_artists?
            @args[:hide_listened_artists].present?
          end

          def tags_include_filter(
            recommendations
          )
            if with_tags?
              recommendations.with_tags(
                @args[:tags_include]
              )
            else
              recommendations
            end
          end

          def with_tags?
            @args[:tags_include].present?
          end

          def tags_exclude_filter(
            recommendations
          )
            if without_tags?
              recommendations.without_tags(
                @args[:tags_exclude]
              )
            else
              recommendations
            end
          end

          def without_tags?
            @args[:tags_exclude].present?
          end

          def artists_include_filter(
            recommendations
          )
            if with_artists?
              recommendations.with_artists(
                @args[:artists_include],
                profile_id:
              )
            else
              recommendations
            end
          end

          def with_artists?
            @args[:artists_include].present?
          end

          def artists_exclude_filter(
            recommendations
          )
            if without_artists?
              recommendations.without_artists(
                @args[:artists_exclude],
                profile_id:
              )
            else
              recommendations
            end
          end

          def without_artists?
            @args[:artists_exclude].present?
          end
        end
      end
    end
  end
end
