module YouTube
  module Playlist
    class Videos < YouTube::Playlist::Base
      private

      def playlist_data
        {
          prev_page: prev_page,
          next_page: next_page,
          videos: videos
        }
      end

      def video_data_formatted(video)
        YouTube::Playlist::Videos::Video.call(
          video: video
        )
      end
    end
  end
end
