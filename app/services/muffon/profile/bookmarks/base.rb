module Muffon
  module Profile
    module Bookmarks
      class Base < Muffon::Profile::Base
        private

        def profile_data
          {
            nickname: profile.nickname,
            bookmarks: bookmarks_data
          }
        end

        def artists
          @artists ||= profile.bookmark_artists
        end

        def albums
          @albums ||= profile.bookmark_albums
        end

        def tracks
          @tracks ||= profile.bookmark_tracks
        end
      end
    end
  end
end
