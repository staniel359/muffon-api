module Muffon
  module Profile
    module Favorites
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def profile_data
          {
            **super,
            favorites: favorites_data
          }
        end

        def artists
          @artists ||=
            profile.favorite_artists
        end

        def albums
          @albums ||=
            profile.favorite_albums
        end

        def tracks
          @tracks ||=
            profile.favorite_tracks
        end

        def videos
          @videos ||=
            profile.favorite_videos
        end
      end
    end
  end
end
