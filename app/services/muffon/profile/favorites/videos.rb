module Muffon
  module Profile
    module Favorites
      class Videos < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'videos'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= videos.count
        end

        def collection_list
          videos
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(favorite_video)
          Muffon::Profile::Favorites::Videos::Video.call(
            favorite_video:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
