module Muffon
  module Profile
    module Bookmarks
      class Tracks < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          tracks.size
        end

        def collection_list
          tracks
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(bookmark_track)
          Muffon::Profile::Bookmarks::Tracks::Track.call(
            bookmark_track:
          )
        end

        alias bookmarks_data paginated_data
      end
    end
  end
end
