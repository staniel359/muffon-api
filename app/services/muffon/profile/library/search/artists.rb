module Muffon
  module Profile
    module Library
      module Search
        class Artists < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def library_data
            return library_minimal_data if @args[:minimal]

            library_base_data
              .merge(paginated_data)
          end

          def library_minimal_data
            { artists: collection }
          end

          def library_base_data
            {
              top_tracks_count:,
              top_albums_count:
            }
          end

          def total_items_count
            search_library_artists.size
          end

          def search_library_artists
            @search_library_artists ||=
              library_artists_joined.where(
                'artists.name_downcase LIKE :query',
                query: query_formatted
              )
          end

          def library_artists_joined
            library_artists.left_joins(
              :artist
            )
          end

          def collection_list
            return minimal_collection_list if @args[:minimal]

            full_collection_list
          end

          def minimal_collection_list
            search_library_artists
              .limit(limit)
              .includes(:artist)
          end

          def full_collection_list
            search_library_artists
              .library_tracks_count_desc_ordered
              .library_albums_count_desc_ordered
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_artist)
            Muffon::Profile::Library::Artists::Artist.call(
              library_artist:,
              profile_id: @args[:profile_id],
              minimal: @args[:minimal]
            )
          end
        end
      end
    end
  end
end
