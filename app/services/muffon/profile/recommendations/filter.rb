module Muffon
  module Profile
    class Recommendations
      class Filter < Muffon::Profile::Recommendations
        def call
          data
        end

        private

        def data
          recommendations_not_deleted
            .then { |r| hide_library_filter(r) }
            .then { |r| hide_listened_filter(r) }
            .then { |r| tags_include_filter(r) }
            .then { |r| tags_exclude_filter(r) }
            .then { |r| artists_include_filter(r) }
            .then { |r| artists_exclude_filter(r) }
        end

        def recommendations_not_deleted
          profile
            .recommendations
            .not_deleted
        end

        def hide_library_filter(recommendations)
          return recommendations if
              @args[:hide_library].blank?

          recommendations.not_in_library(
            @args[:profile_id],
            @args[:hide_library_tracks_count].to_i
          )
        end

        def hide_listened_filter(recommendations)
          return recommendations if
              @args[:hide_listened].blank?

          recommendations.not_in_listened(
            @args[:profile_id]
          )
        end

        def tags_include_filter(recommendations)
          return recommendations if
              @args[:tags_include].blank?

          recommendations.with_tags(
            @args[:tags_include]
          )
        end

        def tags_exclude_filter(recommendations)
          return recommendations if
              @args[:tags_exclude].blank?

          recommendations.without_tags(
            @args[:tags_exclude]
          )
        end

        def artists_include_filter(recommendations)
          return recommendations if
              @args[:artists_include].blank?

          recommendations.with_artists(
            @args[:artists_include],
            @args[:profile_id]
          )
        end

        def artists_exclude_filter(recommendations)
          return recommendations if
              @args[:artists_exclude].blank?

          recommendations.without_artists(
            @args[:artists_exclude],
            @args[:profile_id]
          )
        end
      end
    end
  end
end
