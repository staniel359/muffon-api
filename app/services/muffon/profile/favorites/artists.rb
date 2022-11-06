module Muffon
  module Profile
    module Favorites
      class Artists < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'artists'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= artists.count
        end

        def collection_list
          artists
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(favorite_artist)
          Muffon::Profile::Favorites::Artists::Artist.call(
            favorite_artist:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
