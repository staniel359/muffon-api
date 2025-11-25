module Muffon
  module Profile
    module Favorites
      class Videos < Muffon::Profile::Favorites::Base
        private

        def favorites_data
          paginated_data(
            collection_name: 'videos',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          videos
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def items_count
          videos.count
        end

        def collection_item_data_formatted(favorite_video)
          Muffon::Profile::Favorites::Videos::Video.call(
            favorite_video:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
