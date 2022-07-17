module Muffon
  module Profile
    module Bookmarks
      class Base < Muffon::Profile::Base
        private

        def data
          return forbidden if wrong_profile?

          super
        end

        def profile_data
          {
            nickname: profile.nickname,
            bookmarks: paginated_data
          }
        end
      end
    end
  end
end
