module Muffon
  module Profile
    class Recommendations
      module Hide
        class LibraryArtists < Muffon::Profile::Recommendations
          def call
            data
          end

          private

          def data
            recommendations_not_deleted.where.not(
              'artist_id = ANY(ARRAY[?])',
              hidden_artist_ids
            )
          end

          def hidden_artist_ids
            hidden_library_artists.pluck(
              :artist_id
            ).presence || [0]
          end

          def hidden_library_artists
            profile.library_artists.where(
              'library_tracks_count >= ?',
              @args[:tracks_count].to_i
            )
          end
        end
      end
    end
  end
end
