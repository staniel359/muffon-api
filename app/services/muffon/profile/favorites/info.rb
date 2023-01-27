module Muffon
  module Profile
    module Favorites
      class Info < Muffon::Profile::Favorites::Base
        private

        def favorites_data
          {
            artists_count: artists.count,
            albums_count: albums.count,
            tracks_count: tracks.count,
            videos_count: videos.count
          }
        end
      end
    end
  end
end
