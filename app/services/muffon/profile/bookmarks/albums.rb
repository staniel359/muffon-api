module Muffon
  module Profile
    module Bookmarks
      class Albums < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'albums'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def bookmarks
          @bookmarks ||=
            profile.bookmark_albums
        end

        def collection_list
          super.associated
        end

        def collection_item_data_formatted(bookmark_album)
          Muffon::Profile::Bookmarks::Albums::Album.call(
            bookmark_album:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
