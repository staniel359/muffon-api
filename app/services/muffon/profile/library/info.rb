module Muffon
  module Profile
    module Library
      class Info < Muffon::Profile::Library::Base
        private

        def library_data
          {
            artists_count:
              profile.library_artists_count,
            albums_count:
              profile.library_albums_count,
            tracks_count:
              profile.library_tracks_count
          }
        end
      end
    end
  end
end
