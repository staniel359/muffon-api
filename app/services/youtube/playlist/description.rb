module YouTube
  module Playlist
    class Description < YouTube::Playlist::Info
      private

      def playlist_data
        Muffon::Formatter::VideoPlaylist::Description.call(
          description:
        )
      end
    end
  end
end
