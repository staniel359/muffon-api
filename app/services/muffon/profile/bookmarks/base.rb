module Muffon
  module Profile
    module Bookmarks
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def forbidden?
          !valid_profile?
        end

        def profile_data
          {
            **super,
            bookmarks: bookmarks_data
          }
        end
      end
    end
  end
end
