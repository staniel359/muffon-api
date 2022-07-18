module Muffon
  module Profile
    module Library
      module Track
        class Info < Muffon::Profile::Library::Track::Base
          private

          def track_data
            muffon_data
              .merge(track_base_data)
              .merge(track_extra_data)
          end

          def profile_id
            @args[:other_profile_id]
          end

          def track_extra_data
            {
              album: album_data,
              image: image_data,
              albums_count:
                library_track.library_albums.count,
              playlists_count:
                library_track.profile_playlists.count,
              created: created_formatted
            }.compact
          end
        end
      end
    end
  end
end
