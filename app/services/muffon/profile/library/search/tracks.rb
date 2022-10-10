module Muffon
  module Profile
    module Library
      module Search
        class Tracks < Muffon::Profile::Library::Search::Base
          COLLECTION_NAME = 'tracks'.freeze

          private

          def total_items_count
            search_library_tracks.size
          end

          def search_library_tracks
            @search_library_tracks ||=
              library_tracks_joined.where(
                'tracks.title_downcase LIKE :query ' \
                'OR artists.name_downcase LIKE :query',
                query: query_formatted
              )
          end

          def library_tracks_joined
            library_tracks.left_joins(
              track: :artist
            )
          end

          def collection_list
            search_library_tracks
              .created_desc_ordered
              .limit(limit)
              .offset(offset)
              .associated
          end

          def collection_item_data_formatted(library_track)
            Muffon::Profile::Library::Tracks::Track.call(
              library_track:,
              profile_id: @args[:profile_id]
            )
          end

          alias library_data paginated_data
        end
      end
    end
  end
end
