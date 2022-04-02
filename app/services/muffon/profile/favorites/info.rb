module Muffon
  module Profile
    module Favorites
      class Info < Muffon::Profile::Favorites::Base
        private

        def favorites_data
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
