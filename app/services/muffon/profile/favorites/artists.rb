module Muffon
  module Profile
    module Favorites
      class Artists < Muffon::Profile::Favorites::Base
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
        end

        def collection_item_data_formatted(favorite_artist)
          Muffon::Profile::Favorites::Artists::Artist.call(
            favorite_artist:,
            profile_id: @args[:other_profile_id]
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
