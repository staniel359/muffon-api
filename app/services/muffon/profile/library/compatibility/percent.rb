module Muffon
  module Profile
    module Library
      module Compatibility
        class Percent < Muffon::Profile::Library::Compatibility::Base
          private

          def compatibility_data
            { percent: }
          end

          def percent
            ([
              artists_percent,
              albums_percent,
              tracks_percent
            ].sum / 3).floor
          end

          def artists_percent
            return 0 if artists_average_count.zero?

            artists_count.fdiv(
              artists_average_count
            ) * 100
          end

          def artists_average_count
            @artists_average_count ||= [
              library_artists_count(
                @args[:profile_id]
              ),
              library_artists_count(
                @args[:other_profile_id]
              )
            ].sum / 2
          end

          def library_artists_count(profile_id)
            library_artists(
              profile_id
            ).count
          end

          def albums_percent
            return 0 if albums_average_count.zero?

            albums_count.fdiv(
              albums_average_count
            ) * 100
          end

          def albums_average_count
            @albums_average_count ||= [
              library_albums_count(
                @args[:profile_id]
              ),
              library_albums_count(
                @args[:other_profile_id]
              )
            ].sum / 2
          end

          def library_albums_count(profile_id)
            library_albums(
              profile_id
            ).count
          end

          def tracks_percent
            return 0 if tracks_average_count.zero?

            tracks_count.fdiv(
              tracks_average_count
            ) * 100
          end

          def tracks_average_count
            @tracks_average_count ||= [
              library_tracks_count(
                @args[:profile_id]
              ),
              library_tracks_count(
                @args[:other_profile_id]
              )
            ].sum / 2
          end

          def library_tracks_count(profile_id)
            library_tracks(
              profile_id
            ).count
          end
        end
      end
    end
  end
end
