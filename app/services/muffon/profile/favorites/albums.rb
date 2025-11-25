module Muffon
  module Profile
    module Favorites
      class Albums < Muffon::Profile::Favorites::Base
        private

        def favorites_data
          paginated_data(
            collection_name: 'albums',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          albums
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def items_count
          albums.count
        end

        def collection_item_data_formatted(favorite_album)
          Muffon::Profile::Favorites::Albums::Album.call(
            favorite_album:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
