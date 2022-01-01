module Muffon
  module Profile
    module Library
      module Album
        class Info < Muffon::Profile::Library::Album::Base
          private

          def album_data
            {
              id: profile_album.id,
              favorite_id:,
              title: album.title,
              artist: artist_data,
              image: profile_album.image_data,
              tracks_count:
                profile_album.profile_tracks_count,
              created: created_formatted
            }.compact
          end

          def created_formatted
            datetime_formatted(
              profile_album.created_at
            )
          end
        end
      end
    end
  end
end
