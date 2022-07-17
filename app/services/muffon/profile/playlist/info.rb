module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
        private

        def playlist_data
          Muffon::Profile::Playlists::Playlist.call(
            playlist:
          )
        end

        def playlist
          @playlist ||=
            profile
            .playlists
            .associated
            .find_by(
              id: @args[:playlist_id]
            )
        end
      end
    end
  end
end
