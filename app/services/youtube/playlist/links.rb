module YouTube
  module Playlist
    class Links < YouTube::Playlist::Info
      private

      def playlist_data
        Muffon::Formatter::Source::VideoPlaylist::Links.call(
          source_original_link:,
          source_name:,
          source_video_playlist_id: youtube_id
        )
      end
    end
  end
end
