module Muffon
  module Profile
    module Library
      module Artist
        class Info < Muffon::Profile::Library::Artist::Base
          private

          def artist_data
            {
              **self_data,
              **super,
              image: image_data,
              tracks_count:,
              albums_count:,
              playlists_count:,
              created: created_formatted
            }.compact
          end

          def profile_id
            @args[:other_profile_id]
          end

          def image_data
            artist.image_data
          end

          def playlists_count
            library_artist
              .profile_playlists
              .count
          end
        end
      end
    end
  end
end
