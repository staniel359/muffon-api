module Muffon
  module Profile
    module Library
      module Track
        class Info < Muffon::Profile::Library::Track::Base
          private

          def track_data
            {
              **self_data,
              **super,
              album: album_data,
              image: image_data,
              albums_count:,
              playlists_count:,
              created: created_formatted,
              audio: audio_data
            }.compact
          end

          def profile_id
            @args[:other_profile_id]
          end

          def albums_count
            library_track
              .library_albums
              .count
          end

          def playlists_count
            library_track
              .profile_playlists
              .count
          end
        end
      end
    end
  end
end
