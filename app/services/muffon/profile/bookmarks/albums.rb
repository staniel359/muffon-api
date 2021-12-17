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

        def albums
          @albums ||= profile.bookmark_albums
        end

        def collection_list
          albums
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(album)
          Muffon::Profile::Bookmarks::Albums::Album.call(
            album: album
          )
        end
      end
    end
  end
end
