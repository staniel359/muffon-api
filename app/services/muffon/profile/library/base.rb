module Muffon
  module Profile
    module Library
      class Base < Muffon::Profile::Base
        private

        def profile_data
          {
            nickname: profile.nickname,
            library: library_data
          }
        end

        def library_artists
          @library_artists ||=
            profile.library_artists
        end

        def library_albums
          @library_albums ||=
            profile.library_albums
        end

        def library_tracks
          @library_tracks ||=
            profile.library_tracks
        end
      end
    end
  end
end
