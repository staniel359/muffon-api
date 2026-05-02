module YouTube
  module Playlist
    class Links < YouTube::Playlist::Info
      private

      def playlist_data
        Muffon::Formatter::Source::VideoPlaylist::Links.call(
          video_playlist_record:
        )
      end
    end
  end
end
