module Muffon
  module Profile
    module Library
      module Artist
        class Info < Muffon::Profile::Library::Artist::Base
          private

          def artist_data
            self_data
              .merge(artist_base_data)
              .merge(artist_extra_data)
          end

          def profile_id
            @args[:other_profile_id]
          end

          def artist_extra_data
            {
              image: artist.image_data,
              tracks_count:,
              albums_count:,
              playlists_count:,
              created: created_formatted
            }.compact
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
