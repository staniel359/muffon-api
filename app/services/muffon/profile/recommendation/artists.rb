module Muffon
  module Profile
    module Recommendation
      class Artists < Muffon::Profile::Recommendation::Base
        COLLECTION_NAME = 'artists'.freeze

        include Muffon::Utils::Pagination

        private

        def recommendation_data
          recommendation_base_data
            .merge(paginated_data)
        end

        def recommendation_base_data
          {
            top_tracks_count:,
            top_albums_count:
          }
        end

        def top_tracks_count
          recommendation
            .library_artists
            .library_tracks_count_desc_ordered
            .first
            &.library_tracks_count || 0
        end

        def top_albums_count
          recommendation
            .library_artists
            .library_albums_count_desc_ordered
            .first
            &.library_albums_count || 0
        end

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
      end
    end
  end
end
