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
          @library_artists ||= profile.library_artists
        end

        def library_albums
          @library_albums ||= profile.library_albums
        end

        def library_tracks
          @library_tracks ||= profile.library_tracks
        end

        def top_tracks_count
          return 0 if library_artists.blank?

          library_artists
            .library_tracks_count_desc_ordered
            .first
            .library_tracks_count
        end

        def top_albums_count
          return 0 if library_artists.blank?

          library_artists
            .library_albums_count_desc_ordered
            .first
            .library_albums_count
        end
      end
    end
  end
end
