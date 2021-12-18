module Muffon
  module Profile
    module Playlist
      module Track
        class Destroyer < Muffon::Profile::Playlist::Track::Base
          private

          def primary_args
            super << @args[:playlist_track_id]
          end

          def data
            return forbidden if wrong_profile?

            playlist_track&.destroy

            { playlist_tracks_count: playlist_tracks_count }
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
