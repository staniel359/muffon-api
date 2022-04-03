module Muffon
  module Profile
    module Bookmarks
      class Info < Muffon::Profile::Bookmarks::Base
        private

        def bookmarks_data
          {
            artists_count: artists.size,
            albums_count: albums.size,
            tracks_count: tracks.size
          }
        end
      end
    end
  end
end
