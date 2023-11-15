module Muffon
  module Profile
    module Library
      module Album
        class Info < Muffon::Profile::Library::Album::Base
          private

          def album_data
            self_data
              .merge(album_base_data)
              .merge(album_extra_data)
          end

          def profile_id
            @args[:other_profile_id]
          end

          def album_extra_data
            {
              image: image_data,
              tracks_count:,
              playlists_count:,
              created: created_formatted
            }.compact
          end

          def image_data
            library_album.image_data
          end

          def playlists_count
            library_album
              .profile_playlists
              .count
          end
        end
      end
    end
  end
end
