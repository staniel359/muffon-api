module Muffon
  module Profile
    module Library
      module Artist
        class Info < Muffon::Profile::Library::Artist::Base
          include Muffon::Utils::Artist

          private

          def artist_data
            {
              favorite_id: favorite_id,
              name: name,
              image: image_data,
              tracks_count: tracks_count,
              albums_count: albums_count,
              created: created
            }
          end

          def image_data
            profile_artist
              .artist
              .image_data
          end

          def tracks_count
            profile_artist.profile_tracks_count
          end

          def albums_count
            profile_artist.profile_albums_count
          end

          def created
            datetime_formatted(
              profile_artist.created_at
            )
          end
        end
      end
    end
  end
end
