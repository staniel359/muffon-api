module Muffon
  module Profile
    module Recommendation
      class Artists < Muffon::Profile::Recommendation::Base
        COLLECTION_NAME = 'artists'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||=
            recommendation
            .library_artist_ids
            .size
        end

        def collection_list
          recommendation
            .library_artists
            .library_tracks_count_desc_ordered
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(library_artist)
          Muffon::Profile::Recommendation::Artists::Artist.call(
            library_artist:
          )
        end

        alias recommendation_data paginated_data
      end
    end
  end
end
