module YouTube
  module Playlist
    class Description < YouTube::Playlist::Info
      private

      def playlist_data
        update_video_playlist_record!

        Muffon::Formatter::Source::VideoPlaylist::Description.call(
          video_playlist_record:
        )
      end
    end
  end
end
