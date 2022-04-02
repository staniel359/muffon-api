module Muffon
  module Profile
    module Favorites
      class Albums < Muffon::Profile::Favorites::Base
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

        def collection_item_data_formatted(favorite_album)
          Muffon::Profile::Favorites::Albums::Album.call(
            favorite_album:
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
