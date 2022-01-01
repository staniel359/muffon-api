module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
        private

        def primary_args
          [@args[:playlist_id]]
        end

        def playlist_data
          Muffon::Profile::Playlists::Playlist.call(
            playlist:
          )
        end
      end
    end
  end
end
