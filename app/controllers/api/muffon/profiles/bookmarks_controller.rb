module API
  module Muffon
    module Profiles
      class BookmarksController < API::Muffon::ProfilesController
        def info; end

        private

        def info_data
          ::Muffon::Profile::Bookmarks::Info.call(
            params.slice(
              *%i[
                profile_id
                token
              ]
            )
          )
        end
      end
    end
  end
end
