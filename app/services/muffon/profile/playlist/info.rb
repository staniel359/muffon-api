module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
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
