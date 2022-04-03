module Muffon
  module Profile
    module Bookmarks
      class Artists < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'artists'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          artists.size
        end

        def collection_list
          artists
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(bookmark_artist)
          Muffon::Profile::Bookmarks::Artists::Artist.call(
            bookmark_artist:
          )
        end

        alias bookmarks_data paginated_data
      end
    end
  end
end
