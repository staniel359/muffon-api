module API
  module LastFM
    module Users
      class FavoritesController < API::LastFM::UsersController
        def tracks; end

        private

        def tracks_data
          ::LastFM::User::Favorites::Tracks.call(
            params.slice(
              *%i[
                profile_id token
                nickname page limit
              ]
            )
          )
        end
      end
    end
  end
end
