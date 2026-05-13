module Muffon
  module Profile
    module Recommendations
      class Artists
        class Filter < Muffon::Profile::Recommendations::Artists
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              profile_id
              hide_library_artists
              hide_library_artists_tracks_count
              hide_listened_artists
              tags_include
              tags_exclude
              artists_include
              artists_exclude
            ]
          end

          def data
            collection =
              hide_library_artists_filter(
                recommendations
              )

            collection =
              hide_listened_artists_filter(
                collection
              )

            collection =
              tags_include_filter(
                collection
              )

            collection =
              tags_exclude_filter(
                collection
              )

            collection =
              artists_include_filter(
                collection
              )

            artists_exclude_filter(
              collection
            )
          end

          def recommendations
            profile_record
              .recommendation_artists
              .not_deleted
              .joined
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

          def tags_include_filter(
            recommendations
          )
            if @args[:tags_include].present?
              recommendations.with_tags(
                tags_names: @args[:tags_include]
              )
            else
              recommendations
            end
          end

          def tags_exclude_filter(
            recommendations
          )
            if @args[:tags_exclude].present?
              recommendations.without_tags(
                tags_names: @args[:tags_exclude]
              )
            else
              recommendations
            end
          end

          def artists_include_filter(
            recommendations
          )
            if @args[:artists_include].present?
              recommendations.with_artists(
                artists_names: @args[:artists_include],
                profile_id: @args[:profile_id]
              )
            else
              recommendations
            end
          end

          def artists_exclude_filter(
            recommendations
          )
            if @args[:artists_exclude].present?
              recommendations.without_artists(
                artists_names: @args[:artists_exclude],
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
