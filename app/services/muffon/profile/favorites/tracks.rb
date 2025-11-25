module Muffon
  module Profile
    module Favorites
      class Tracks < Muffon::Profile::Favorites::Base
        private

        def favorites_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          tracks
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
            .associated
        end

        def items_count
          tracks.count
        end

        def collection_item_data_formatted(favorite_track)
          Muffon::Profile::Favorites::Tracks::Track.call(
            favorite_track:,
            profile_id: @args[:other_profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
