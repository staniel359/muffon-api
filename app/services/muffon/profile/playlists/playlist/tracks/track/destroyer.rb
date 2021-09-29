module Muffon
  module Profile
    class Playlists
      class Playlist
        class Tracks
          class Track
            class Destroyer <
                Muffon::Profile::Playlists::Playlist::Tracks::Track
              private

              def primary_args
                [
                  @args.profile_id,
                  @args.token,
                  @args.track_id
                ]
              end

              def data
                return forbidden if wrong_profile?

                playlist_track&.destroy
              end

              def playlist_track
                ::PlaylistTrack.find_by(
                  id: @args.track_id
                )
              end
            end
          end
        end
      end
    end
  end
end
