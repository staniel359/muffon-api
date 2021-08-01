module Muffon
  module Profile
    module Library
      class Info < Muffon::Profile::Library::Base
        private

        def library_data
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
