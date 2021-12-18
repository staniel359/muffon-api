module Muffon
  module Profile
    module Playlist
      module Track
        class Base < Muffon::Profile::Playlist::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:playlist_id]
            ]
          end

          def playlist_tracks_count
            playlist.playlist_tracks_count
          end
        end
      end
    end
  end
end
