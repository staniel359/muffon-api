module Muffon
  module Profile
    class Playlists
      class Playlist
        class Updater < Muffon::Profile::Playlists::Playlist::Base
          private

          def primary_args
            [
              @args.profile_id,
              @args.token,
              @args.playlist_id
            ]
          end

          def data
            return forbidden if wrong_profile?

            playlist.update(
              update_params
            )

            return errors_data if errors?

            process_image

            { profile: profile_data }
          end

          def update_params
            @args.to_h.slice(:title)
          end

          def playlist_data
            Muffon::Profile::Playlists::Playlist.call(
              playlist: playlist
            )
          end
        end
      end
    end
  end
end
