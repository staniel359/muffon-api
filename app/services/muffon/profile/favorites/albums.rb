module Muffon
  module Profile
    module Favorites
      class Albums < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'albums'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= albums.count
        end

        def collection_list
          albums
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(favorite_album)
          Muffon::Profile::Favorites::Albums::Album.call(
            favorite_album:,
            profile_id: @args[:other_profile_id]
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
