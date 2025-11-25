module Muffon
  module Profile
    module Recommendation
      module Artist
        class Artists < Muffon::Profile::Recommendation::Artist::Base
          private

          def recommendation_data
            {
              top_tracks_count:,
              top_albums_count:,
              **artists_data
            }
          end

          def top_tracks_count
            artists
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def artists
            @artists ||= recommendation.library_artists
          end

          def top_albums_count
            artists
              .library_albums_count_desc_ordered
              .first
              &.library_albums_count || 0
          end

          def artists_data
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
              .library_tracks_count_desc_ordered
              .associated
              .limit(limit)
              .offset(offset)
          end

          def items_count
            recommendation
              .library_artist_ids
              .size
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
