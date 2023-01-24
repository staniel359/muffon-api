module Muffon
  module Profile
    class Recommendations
      class Hide < Muffon::Profile::Recommendations
        def call
          data
        end

        private

        def data
          if hide?
            recommendations_not_deleted_hidden
          else
            recommendations_not_deleted
          end
        end

        def hide?
          @args[:hide_library_artists] ||
            @args[:hide_listened_artists]
        end

        def recommendations_not_deleted_hidden
          recommendations_not_deleted
            .where
            .not(
              'artist_id = ANY(ARRAY[?])',
              artists_ids
            )
        end

        def recommendations_not_deleted
          profile
            .recommendations
            .not_deleted
        end

        def artists_ids
          (
            artists_ids_from_library |
              artists_ids_from_listened
          ).presence || [0]
        end

        def artists_ids_from_library
          return [] unless
              @args[:hide_library_artists]

          profile
            .library_artists
            .where(
              'library_tracks_count >= ?',
              tracks_count
            ).pluck(
              :artist_id
            )
        end

        def tracks_count
          @args[:tracks_count].to_i
        end

        def artists_ids_from_listened
          return [] unless
              @args[:hide_listened_artists]

          profile
            .listened_artists
            .pluck(
              :artist_id
            )
        end
      end
    end
  end
end
