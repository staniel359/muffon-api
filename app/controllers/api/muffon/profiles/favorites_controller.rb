module API
  module Muffon
    module Profiles
      class FavoritesController < API::Muffon::ProfilesController
        def info; end

        private

        def info_data
          ::Muffon::Profile::Favorites::Info.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
              ]
            )
          )
        end
      end
    end
  end
end
