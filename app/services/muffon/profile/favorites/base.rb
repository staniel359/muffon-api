module Muffon
  module Profile
    module Favorites
      class Base < Muffon::Profile::Base
        private

        def data
          { profile: profile_data }
        end

        def profile_data
          {
            nickname: profile.nickname,
            favorites: favorites_data
          }
        end
      end
    end
  end
end
