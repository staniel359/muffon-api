module Muffon
  module Profile
    module Recommendation
      module Artist
        class Artists < Muffon::Profile::Recommendation::Artist::Base
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
              .associated
              .limit(limit)
              .offset(offset)
          end

          def collection_item_data_formatted(library_artist)
            Muffon::Profile::Library::Artists::Artist.call(
              library_artist:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
