module Muffon
  module Profile
    module Library
      class Base < Muffon::Profile::Base
        private

        def data
          { profile: profile_data }
        end

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
      end
    end
  end
end
