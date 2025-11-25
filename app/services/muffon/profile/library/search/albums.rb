module Muffon
  module Profile
    module Library
      module Search
        class Albums < Muffon::Profile::Library::Search::Base
          DEFAULT_ORDER =
            'library_tracks_count_desc'.freeze

          private

          def library_data
            {
              top_tracks_count:,
              **albums_data
            }
          end

          def top_tracks_count
            albums
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def albums
            @albums ||=
              library_albums
              .left_joins(
                album: :artist
              )
              .where(
                'albums.title_downcase LIKE :query ' \
                'OR artists.name_downcase LIKE :query',
                query: query_formatted
              )
          end

          def albums_data
            paginated_data(
              collection_name: 'albums',
              raw_collection:,
              page:,
              limit:,
              items_count:
            )
          end

          def raw_collection
            albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
          end

          def items_count
            albums.count
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Albums::Album.call(
              library_album:,
              profile_id: @args[:profile_id],
              token: @args[:token]
            )
          end
        end
      end
    end
  end
end
