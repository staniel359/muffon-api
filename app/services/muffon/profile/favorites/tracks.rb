module Muffon
  module Profile
    module Favorites
      class Tracks < Muffon::Profile::Favorites::Base
        COLLECTION_NAME = 'tracks'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          tracks.size
        end

        def collection_list
          tracks
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(favorite_track)
          Muffon::Profile::Favorites::Tracks::Track.call(
            favorite_track:,
            profile_id: @args[:other_profile_id]
          )
        end

        alias favorites_data paginated_data
      end
    end
  end
end
