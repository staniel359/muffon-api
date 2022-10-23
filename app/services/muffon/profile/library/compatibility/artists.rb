module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists < Muffon::Profile::Library::Compatibility::Base
          COLLECTION_NAME = 'artists'.freeze

          private

          def total_items_count
            artists_count
          end

          def collection_list
            other_profile_library_artists
              .library_tracks_count_desc_ordered
              .limit(limit)
              .offset(offset)
          end

          def other_profile_library_artists
            library_artists(
              @args[:other_profile_id]
            ).where(
              artist_id: common_artist_ids
            )
          end

          def collection_item_data_formatted(library_artist)
            Muffon::Profile::Library::Compatibility::Artists::Artist.call(
              library_artist:
            )
          end

          alias compatibility_data paginated_data
        end
      end
    end
  end
end
