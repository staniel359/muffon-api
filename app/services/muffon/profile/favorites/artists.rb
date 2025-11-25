module Muffon
  module Profile
    module Favorites
      class Artists < Muffon::Profile::Favorites::Base
        private

        def favorites_data
          paginated_data(
            collection_name: 'artists',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          artists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def items_count
          artists.count
        end

        def collection_item_data_formatted(favorite_artist)
          Muffon::Profile::Favorites::Artists::Artist.call(
            favorite_artist:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
