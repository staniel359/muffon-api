module YouTube
  module Playlist
    class Info < YouTube::Playlist::Base
      include YouTube::Mixins::VideoPlaylist

      private

      def request_params
        {
          **super,
          id: @args[:playlist_id],
          part: 'snippet,contentDetails'
        }
      end

      def playlist_data
        update_video_playlist_record!

        Muffon::Formatter::Source::VideoPlaylist::Info.call(
          video_playlist_record:,
          **self_args
        )
      end
    end
  end
end
