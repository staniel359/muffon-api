module Muffon
  module Profile
    class Playlists
      class Playlist
        class Info < Muffon::Profile::Playlists::Playlist::Base
          private

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
