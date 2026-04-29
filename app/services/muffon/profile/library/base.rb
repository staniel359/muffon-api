module Muffon
  module Profile
    module Library
      class Base < Muffon::Profile::Base
        private

        def profile_data
          {
            **super,
            library: library_data
          }
        end

        def library_artists
          @library_artists ||=
            profile_record.library_artists
        end

        def library_albums
          @library_albums ||=
            profile_record.library_albums
        end

        def library_tracks
          @library_tracks ||=
            profile_record.library_tracks
        end
      end
    end
  end
end
