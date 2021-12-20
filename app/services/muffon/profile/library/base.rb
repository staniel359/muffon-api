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

        def artists
          @artists ||= profile.profile_artists
        end

        def albums
          @albums ||= profile.profile_albums
        end

        def tracks
          @tracks ||= profile.profile_tracks
        end

        def top_tracks_count
          return 0 if artists.blank?

          artists
            .profile_tracks_count_desc_ordered
            .first
            .profile_tracks_count
        end

        def top_albums_count
          return 0 if artists.blank?

          artists
            .profile_albums_count_desc_ordered
            .first
            .profile_albums_count
        end
      end
    end
  end
end
