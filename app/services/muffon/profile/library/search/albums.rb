module Muffon
  module Profile
    module Library
      module Search
        class Albums < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'albums'.freeze

          private

          def total_items_count
            search_library_albums.size
          end

          def search_library_albums
            @search_library_albums ||=
              library_albums_joined.where(
                'LOWER(albums.title) LIKE :query '\
                'OR LOWER(artists.name) LIKE :query',
                query: query_formatted
              )
          end

          def library_albums_joined
            library_albums.left_joins(
              album: :artist
            )
          end

          def collection_list
            search_library_albums
              .library_tracks_count_desc_ordered
              .created_asc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_album)
            Muffon::Profile::Library::Albums::Album.call(
              library_album:,
              profile_id: @args[:profile_id]
            )
          end

          alias library_data paginated_data
        end
      end
    end
  end
end
