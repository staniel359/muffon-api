module Muffon
  module Profile
    module Bookmarks
      class Albums < Muffon::Profile::Bookmarks::Base
        COLLECTION_NAME = 'albums'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= albums.count
        end

        def albums
          @albums ||= profile.bookmark_albums
        end

        def collection_list
          albums
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(bookmark_album)
          Muffon::Profile::Bookmarks::Albums::Album.call(
            bookmark_album:,
            profile_id: @args[:profile_id]
          )
        end
      end
    end
  end
end
