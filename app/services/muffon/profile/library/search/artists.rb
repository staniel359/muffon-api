module Muffon
  module Profile
    module Library
      module Search
        class Artists < Muffon::Profile::Library::Search::Base
          DEFAULT_ORDER =
            'library_tracks_count_desc'.freeze

          private

          def library_data
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
            @artists ||=
              library_artists
              .left_joins(
                :artist
              ).where(
                'artists.name_downcase LIKE :query',
                query: query_formatted
              )
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
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def items_count
            artists.count
          end

          def collection_item_data_formatted(
            library_artist_record
          )
            Muffon::Formatter::Library::Artists::Artist.call(
              library_artist_record:,
              is_minimal: @args[:minimal] || @args[:is_minimal],
              **self_args
            )
          end
        end
      end
    end
  end
end
