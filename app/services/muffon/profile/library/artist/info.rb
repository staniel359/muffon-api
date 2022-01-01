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
              id: profile_artist.id,
              favorite_id:,
              name: artist.name
            }.compact
          end

          def artist_extra_data
            {
              image: artist.image_data,
              tracks_count:
                profile_artist.profile_tracks_count,
              albums_count:
                profile_artist.profile_albums_count,
              created: created_formatted
            }.compact
          end

          def created_formatted
            datetime_formatted(
              profile_artist.created_at
            )
          end
        end
      end
    end
  end
end
