module Muffon
  module Profile
    module Library
      module Artist
        class Info < Muffon::Profile::Library::Artist::Base
          private

          def artist_data
            artist_base_data
              .merge(artist_extra_data)
          end

          def artist_base_data
            {
              library: library_artist_data,
              favorite_id:,
              name:
            }.compact
          end

          def artist_extra_data
            {
              image: artist.image_data,
              tracks_count:
                library_artist.library_tracks_count,
              albums_count:
                library_artist.library_albums_count,
              created: created_formatted
            }.compact
          end

          def created_formatted
            datetime_formatted(
              library_artist.created_at
            )
          end
        end
      end
    end
  end
end
