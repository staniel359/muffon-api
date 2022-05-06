module Muffon
  module Profile
    module Library
      class Info < Muffon::Profile::Library::Base
        private

        def library_data
          {
            artists_count: library_artists.size,
            albums_count: library_albums.size,
            tracks_count: library_tracks.size
          }
        end
      end
    end
  end
end
