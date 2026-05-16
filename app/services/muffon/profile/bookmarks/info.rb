module Muffon
  module Profile
    module Bookmarks
      class Info < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          {
            artists_count: artists.count,
            albums_count: albums.count,
            tracks_count: tracks.count,
            videos_count: videos.count,
            video_channels_count: video_channels.count,
            video_playlists_count: video_playlists.count
          }
        end
      end
    end
  end
end
