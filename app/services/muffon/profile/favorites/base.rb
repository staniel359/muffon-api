module Muffon
  module Profile
    module Favorites
      class Base < Muffon::Profile::Base
        private

        def profile_data
          {
            nickname: profile.nickname,
            favorites: paginated_data
          }
        end
      end
    end
  end
end
