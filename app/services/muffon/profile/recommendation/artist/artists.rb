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
            @artists ||= recommendation_record.library_artists
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
              .limit(limit)
              .offset(offset)
              .with_relations
          end

          def items_count
            recommendation_record
              .library_artist_ids
              .size
          end

          def collection_item_data_formatted(
            library_artist_record
          )
            Muffon::Formatter::Library::Artists::Artist.call(
              library_artist_record:,
              **self_args
            )
          end
        end
      end
    end
  end
end
