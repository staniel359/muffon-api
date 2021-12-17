module Muffon
  module Profile
    module Library
      module Album
        class Info < Muffon::Profile::Library::Album::Base
          include Muffon::Utils::Album

          private

          def album_data
            {
              id: id,
              favorite_id: favorite_id,
              title: title,
              artist: artist_data,
              image: image_data,
              tracks_count: tracks_count,
              created: created
            }.compact
          end

          def id
            profile_album.id
          end

          def artist_name
            profile_album
              .album
              .artist
              .name
          end

          def image_data
            profile_album.image_data
          end

          def tracks_count
            profile_album.profile_tracks_count
          end

          def created
            datetime_formatted(
              profile_album.created_at
            )
          end
        end
      end
    end
  end
end
