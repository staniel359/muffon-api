module Muffon
  module Profile
    module Bookmarks
      class Albums < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'albums'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          albums.size
        end

        def collection_list
          albums
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(bookmark_album)
          Muffon::Profile::Bookmarks::Albums::Album.call(
            bookmark_album:
          )
        end

        alias bookmarks_data paginated_data
      end
    end
  end
end
