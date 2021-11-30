module Muffon
  module Profile
    module Playlist
      module Track
        class Destroyer < Muffon::Profile::Playlist::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:playlist_id],
              @args[:playlist_track_id]
            ]
          end

          def data
            return forbidden if wrong_profile?

            playlist_track&.destroy

            { success: true }
          end

          def playlist_track
            playlist.playlist_tracks.find_by(
              id: @args[:playlist_track_id]
            )
          end
        end
      end
    end
  end
end
