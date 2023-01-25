module Muffon
  module Profile
    module Library
      module Search
        class Albums < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'albums'.freeze
          DEFAULT_ORDER = 'library_tracks_count_desc'.freeze

          private

          def library_data
            library_base_data
              .merge(paginated_data)
          end

          def library_base_data
            { top_tracks_count: }
          end

          def top_tracks_count
            search_library_albums
              .library_tracks_count_desc_ordered
              .first
              &.library_tracks_count || 0
          end

          def search_library_albums
            @search_library_albums ||=
              library_albums_joined.where(
                'albums.title_downcase LIKE :query ' \
                'OR artists.name_downcase LIKE :query',
                query: query_formatted
              )
          end

          def total_items_count
            @total_items_count ||=
              search_library_albums.count
          end

          def library_albums_joined
            library_albums.left_joins(
              album: :artist
            )
          end

          def collection_list
            search_library_albums
              .ordered(order, DEFAULT_ORDER)
              .limit(limit)
              .offset(offset)
              .associated
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
